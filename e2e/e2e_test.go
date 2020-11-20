// Copyright 2019 The Kubernetes Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package e2e

import (
	"testing"

	clt "github.com/open-cluster-management/applifecycle-backend-e2e/client"
)

const (
	defaultAddr     = "localhost:8765"
	runEndpoint     = "/run"
	clusterEndpoint = "/clusters"
	Success         = "succeed"
)

func TestE2ESuite(t *testing.T) {
	if err := clt.IsSeverUp(defaultAddr, clusterEndpoint); err != nil {
		t.Fatal(err)
	}

	runner := clt.NewRunner(defaultAddr, runEndpoint)

	testIDs := []string{"chn-001", "chn-002", "chn-003", "chn-004"}

	for _, tID := range testIDs {
		if err := runner.Run(tID); err != nil {
			t.Fatal(err)
		}
	}

	t.Logf("channel e2e tests %v passed", testIDs)
}
