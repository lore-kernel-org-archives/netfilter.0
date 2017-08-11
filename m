From: "Chris" <chris2014@postbox.xyz>
Subject: (unknown)
Date: Sat, 12 Aug 2017 00:09:53 +0200
Message-ID: <40b4be3f26c0242f8b125cd5217a67f5.squirrel@mail2.postbox.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Subject: 
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

All,

I'm using 4.4.0-89-generic #112-Ubuntu Kernel.

I've setup a bridge

bridge name        bridge id                STP enabled        interfaces
br0                8000.00322e111b2        no                enp3s0
                                                        vnet0

Why is it possible to DROP packages from a KVM guest on the host INPUT
chain, but not to LOG them?

I've not loaded any bridge-nf modules. bridge/nf_call_iptables is 0.

- Chris


