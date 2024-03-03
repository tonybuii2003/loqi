// Copyright (c) HashiCorp, Inc.
// SPDX-License-Identifier: MPL-2.0

package main

import (
	"context"
	"fmt"
	"log"

	vault "github.com/hashicorp/vault/api"
)

// This is the accompanying code for the Developer Quick Start.
// WARNING: Using root tokens is insecure and should never be done in production!
func main() {
	config := vault.DefaultConfig()

	config.Address = "http://52.151.255.24:8200/"

	client, err := vault.NewClient(config)
	if err != nil {
		log.Fatalf("unable to initialize Vault client: %v", err)
	}

	// Authenticate
	client.SetToken("myroot")

	secretData := map[string]interface{}{
		"secret": "loqi",
	}

	// Write a secret
	_, err = client.KVv2("secret").Put(context.Background(), "access_check", secretData)
	if err != nil {
		log.Fatalf("unable to write secret: %v", err)
	}

	fmt.Println("Secret written successfully.")

	// Read a secret from the default mount path for KV v2 in dev mode, "secret"
	secret, err := client.KVv2("secret").Get(context.Background(), "access_check")
	if err != nil {
		log.Fatalf("unable to read secret: %v", err)
	}

	value, ok := secret.Data["secret"].(string)

	if !ok {
		log.Fatalf("value type assertion failed: %T %#v", secret.Data["secret"], secret.Data["secret"])
	}

	if value != "loqi" {
		log.Fatalf("unexpected password value %q retrieved from vault", value)
	}

	fmt.Println("Access granted!")
}
