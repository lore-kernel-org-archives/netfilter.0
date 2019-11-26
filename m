From: Harald Dunkel <harald.dunkel@aixigo.com>
Subject: Re: WARNING: CPU: 9 PID: 0 at net/netfilter/nf_conntrack_core.c:977
 __nf_conntrack_confirm+0x4e5/0x6f0 [nf_conntrack]
Date: Tue, 26 Nov 2019 08:18:35 +0100
Message-ID: <4e3ab3b0-2a1f-1772-ab3c-e7f6ce8fd4e3@aixigo.com>
References: <e6eaa72a-08f3-9645-d37b-6367eee90078@aixigo.com>
 <d4656ade-d2fd-92fc-0f3e-5abb7c3f01e2@aixigo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d4656ade-d2fd-92fc-0f3e-5abb7c3f01e2@aixigo.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Anybody interested?

Dropping the obsolete port mapping did *not* help. It crashed again.

Currently I would assume that the problem is triggered by the combination
of bridge and macvlan interfaces. Since I have bound the macvlan to eth0
(2 days ago) there was no incident anymore. Before it died within a
few hours.


Regards
Harri
