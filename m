From: =?iso-8859-1?Q?Svavar_=D6rn_Eysteinsson?= <svavar@fiton.is>
Subject: SNAT?
Date: Tue, 29 Oct 2002 12:33:26 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003f01c27f47$60e06740$c800640a@grooverider>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: NetFilter Mailing List <netfilter@lists.samba.org>

Hi everyone.
I=92m very new to doing the SNAT thing.

The thing is, is there any way to SNAT a individual computer on my
internal network to a different public ip address?


This is my network=20


{ INTERNET }
    |
    |
[--------|
[ ROUTER ]
[--------]
    |
    |
    |
x.x.x.98/24
    |
|--eth0----|
| Firewall |
|          |
|          -eth1-> 10.100.0.0/24 Internal Network
|----------|

All my internal network is masqueraded as the x.x.x.98/24 ip address. I
want to SNAT my internal IP address 10.100.0.200 to x.x.x.99/24 Is that
possible?

Isn't that right, that I need to do the "ip" command for the x.x.x.99
address on my firewall?=20

I did "ip address add x.x.x.99 dev eth0

Could someone advice me on doing the SNAT thing with iptables. Any help
would be appreciated.

Best regards to all,

Svavar Orn
Reykjavik - Iceland



