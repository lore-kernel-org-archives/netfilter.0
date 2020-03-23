From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: TCP and UDP dport in the same rule
Date: Mon, 23 Mar 2020 14:47:23 +0100
Message-ID: <d7d20afc-f96e-a133-30a1-0230a76e06d0@thelounge.net>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <477be69c-1afd-233c-1126-b081aab6a244@thelounge.net>
 <0b44d0eb-5d52-d0c8-fe6c-ccbe6ba88e01@fhmtech.com>
 <7f1b28fa-faeb-c89d-b94f-74e412c02e8f@thelounge.net>
 <20200323114606.y4mudsebactsddkn@salvia>
 <ad3e251f-8453-efc4-5c9e-c167a8989e20@thelounge.net>
 <20200323131403.f2hzmrfpombxz7vx@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------D893F889BD536F4FC101DE6E"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200323131403.f2hzmrfpombxz7vx@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Frank Myhr <fmyhr@fhmtech.com>, Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------D893F889BD536F4FC101DE6E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



Am 23.03.20 um 14:14 schrieb Pablo Neira Ayuso:
> On Mon, Mar 23, 2020 at 01:43:45PM +0100, Reindl Harald wrote:
> [...]
>> {LAN_BASE_IPV4} depends on a shell variable which depends on $HOSTNAME
>> and so on......
>>
>> [root@firewall:/scripts/firewall]$  cat ipset_ADMIN_CLIENTS.txt
>> # Supported:
>> #  - Single IP   (192.168.1.1)
>> #  - CIDR-Ranges (192.168.1.0/24)
>> #  - From-To     (192.168.1.10-192.168.1.20)
>> #
>> # Substitution:
>> #  - {LAN_BASE_IPV4}
>> #  - {WAN_BASE_IPV4}
>> #  - {IPV6_PREFIX}
>>
>> {LAN_BASE_IPV4}.244
>> {LAN_BASE_IPV4}.103
> 
> Could you provide a bit mode details on this substitution feature you
> implemented in your scripts?

well, i try at least :-)

see "ipset-function.txt" which is the core function shared by the script
which resets/builds the ruleset from scratch and by the admin interface

in summary that's the result of "the firewall i want to have and can't
buy anywhere"

--------------------

[root@firewall:~]$  firewall_status.sh | grep "add\-set" | wc -l
4
[root@firewall:~]$  firewall_status.sh | grep "match\-set" | wc -l
43

--------------------

basicly the whole stuff is 4000 lines bash code building up a corporate
firewall for a /24 network with servers and clients with a bash TUI backend

in a nested ESXi we have a 1:1 copy of the firewall-vm, one vm with a
whole /24 on the lan interface and a vm on the wan interface test
rulesets and the substitution is based on the hostname

so you can do "synch-from-live.sh", implement stuff, test it and be sure
that "synch-to-live.sh" and aplly "firewall.sh" at production behaves
identical

* NAT
* ratelimits
  - xt_recent in different stages (mangle/filter/raw)
  - first limit just drops
  - second limit adds to ipset in -t "raw"
* connlimits
* honeypot machines
* honeypot ports
* ipset to split ruleset and data
* ipset to get performance with large dynamic blacklists

--------------------

the TUI interface besides a lot of statistics based on iptables --list
and grep/awk/bc-magic also controls ipsets and shows statistics and entries

if one of the textfiles was changed by "nano" called from the TUI a
reload is triggered -> strip out comments, check with "ipcalc" if it's a
valid ip/cidr and if it's ipv4/ipv6

so it builds a temporary ipset for ipv4 *and* ipv6 if loaded and then
switchs between old and new

to add new ipsets just create a textfile and add it to "config.inc.sh",
it will get laoded and appear automatically in the TUI and with hooks in
"custom.inc.sh" you place iptables rules

the whole stuff is designed to use iptables or ip6tables automatically
and use the _IPV4 or _IPV6 suffixed ipset

--------------------

RULES:
256  IPV4  total
203  IPV4  filter
31   IPV4  mangle
14   IPV4  raw
8    IPV4  nat

CHAINS:
64  IPV4  total
52  IPV4  filter
9   IPV4  mangle
2   IPV4  raw
1   IPV4  nat

--------------------

[root@firewall:/scripts/firewall]$  /bin/ls -1
config.inc.sh
custom.inc.sh
firewall.sh
ipset_ADMIN_CLIENTS.txt
ipset_BAYES_SYNC.txt
ipset_BLOCKED.txt
ipset_EXCLUDES.txt
ipset_HONEYPOT_IPS.txt
ipset_HONEYPOT_PORTS.txt
ipset_IANA_RESERVED.txt
ipset_IPERF.txt
ipset_JABBER.txt
ipset_LAN_VPN_FORWARDING.txt
ipset_OUTBOUND_BLOCKED_PORTS.txt
ipset_OUTBOUND_BLOCKED_SRC.txt
ipset_PORTSCAN_PORTS.txt
ipset_PORTS_MAIL.txt
ipset_PORTS_RESTRICTED.txt
ipset_RBL_SYNC.txt
ipset_RESTRICTED.txt
ipset_SFTP_22.txt
ipset_SSH_HOSTING.txt
shared.inc.sh
tui.sh
update-blocked-feed.sh

--------------D893F889BD536F4FC101DE6E
Content-Type: text/plain; charset=UTF-8;
 name="ipset-function.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="ipset-function.txt"

CmZ1bmN0aW9uIGlwc2V0X2xvYWRfaXBsaXN0KCkKewogZGVidWdfbXNnICJGVU5DVElPTjog
aXBzZXRfbG9hZF9pcGxpc3QgJDEiCiBsb2NhbCBJVEVNIExFRlQgUklHSFQgRklMRT0iJEZJ
UkVXQUxMX0JBU0VESVIvaXBzZXRfJDEudHh0IgogaWYgWyAtZiAiJEZJTEUiIF07IHRoZW4K
ICBpZiBbICIkMiIgPT0gMSBdOyB0aGVuCiAgIGVjaG8gLWUgIiRJUFNFVCAtZXhpc3QgY3Jl
YXRlICR7MX1fSVBWNF9UTVAgJElQU0VUX0lQTElTVF9QQVJBTVMgZmFtaWx5IGluZXQiCiAg
IGVjaG8gLWUgIiRJUFNFVCAke0NPTE9SX0NPREV9Zmx1c2gke0NPTE9SX1NUT1B9ICR7MX1f
SVBWNF9UTVBcbiIKICAgaWYgWyAiJElQVjZfTE9BREVEIiA9PSAxIF07IHRoZW4KICAgIGVj
aG8gLWUgIiRJUFNFVCAtZXhpc3QgY3JlYXRlICR7MX1fSVBWNl9UTVAgJElQU0VUX0lQTElT
VF9QQVJBTVMgZmFtaWx5IGluZXQ2IgogICAgZWNobyAtZSAiJElQU0VUICR7Q09MT1JfQ09E
RX1mbHVzaCR7Q09MT1JfU1RPUH0gJHsxfV9JUFY2X1RNUFxuIgogICBmaQogIGZpCiAgJElQ
U0VUIC1leGlzdCBjcmVhdGUgIiR7MX1fSVBWNCIgJElQU0VUX0lQTElTVF9QQVJBTVMgZmFt
aWx5IGluZXQKICAkSVBTRVQgLWV4aXN0IGNyZWF0ZSAiJHsxfV9JUFY0X1RNUCIgJElQU0VU
X0lQTElTVF9QQVJBTVMgZmFtaWx5IGluZXQKICAkSVBTRVQgZmx1c2ggIiR7MX1fSVBWNF9U
TVAiCiAgaWYgWyAiJElQVjZfTE9BREVEIiA9PSAxIF07IHRoZW4KICAgJElQU0VUIC1leGlz
dCBjcmVhdGUgIiR7MX1fSVBWNiIgJElQU0VUX0lQTElTVF9QQVJBTVMgZmFtaWx5IGluZXQ2
CiAgICRJUFNFVCAtZXhpc3QgY3JlYXRlICIkezF9X0lQVjZfVE1QIiAkSVBTRVRfSVBMSVNU
X1BBUkFNUyBmYW1pbHkgaW5ldDYKICAgJElQU0VUIGZsdXNoICIkezF9X0lQVjZfVE1QIgog
IGZpCiAgZm9yIElURU0gaW4gJChyZWFkX2ZpbGVfZncgIiRGSUxFIiAxKTsgZG8KICAgaWYg
W1sgJElURU0gPT0gKictJyogXV07IHRoZW4KICAgIHJlYWQgTEVGVCBSSUdIVCA8PDwgIiR7
SVRFTS8vLS8gfSIKICAgIGlmIGlwY2FsYyAtLXNpbGVudCAtYyAtNCAiJHtMRUZUfSI7IHRo
ZW4KICAgICBpZiBbICIkMiIgPT0gMSBdOyB0aGVuIGVjaG8gLWUgIiRJUFNFVCBhZGQgJHsx
fV9JUFY0X1RNUCAke0NPTE9SX0NPREV9JHtJVEVNfSR7Q09MT1JfU1RPUH0iOyBmaQogICAg
ICRJUFNFVCBhZGQgIiR7MX1fSVBWNF9UTVAiICIkSVRFTSIKICAgIGVsc2UKICAgICBpZiBb
ICIkSVBWNl9MT0FERUQiID09IDEgXTsgdGhlbgogICAgICBpZiBbICIkMiIgPT0gMSBdOyB0
aGVuIGVjaG8gLWUgIiRJUFNFVCBhZGQgJHsxfV9JUFY2X1RNUCAke0NPTE9SX0NPREV9JHtJ
VEVNfSR7Q09MT1JfU1RPUH0iOyBmaQogICAgICAkSVBTRVQgYWRkICIkezF9X0lQVjZfVE1Q
IiAiJElURU0iCiAgICAgZmkKICAgIGZpCiAgIGVsc2UKICAgIGlmIGlwY2FsYyAtLXNpbGVu
dCAtYyAtNCAiJElURU0iOyB0aGVuCiAgICAgaWYgWyAiJDIiID09IDEgXTsgdGhlbiBlY2hv
IC1lICIkSVBTRVQgYWRkICR7MX1fSVBWNF9UTVAgJHtDT0xPUl9DT0RFfSR7SVRFTX0ke0NP
TE9SX1NUT1B9IjsgZmkKICAgICAkSVBTRVQgYWRkICIkezF9X0lQVjRfVE1QIiAiJElURU0i
CiAgICBlbHNlCiAgICAgaWYgWyAiJElQVjZfTE9BREVEIiA9PSAxIF07IHRoZW4KICAgICAg
aWYgWyAiJDIiID09IDEgXTsgdGhlbiBlY2hvIC1lICIkSVBTRVQgYWRkICR7MX1fSVBWNl9U
TVAgJHtDT0xPUl9DT0RFfSR7SVRFTX0ke0NPTE9SX1NUT1B9IjsgZmkKICAgICAgJElQU0VU
IGFkZCAiJHsxfV9JUFY2X1RNUCIgIiRJVEVNIgogICAgIGZpCiAgICBmaQogICBmaQogIGRv
bmUKICBpZiBbICIkMiIgPT0gMSBdOyB0aGVuCiAgIGVjaG8gLWUgIlxuJHtDT0xPUl9DT0RF
fSRJUFNFVCBzd2FwJHtDT0xPUl9TVE9QfSAkezF9X0lQVjRfVE1QICR7MX1fSVBWNCIKICAg
ZWNobyAtZSAiJHtDT0xPUl9DT0RFfSRJUFNFVCBkZXN0cm95JHtDT0xPUl9TVE9QfSAkezF9
X0lQVjRfVE1QXG4iCiAgIGlmIFsgIiRJUFY2X0xPQURFRCIgPT0gMSBdOyB0aGVuCiAgICBl
Y2hvIC1lICIke0NPTE9SX0NPREV9JElQU0VUIHN3YXAke0NPTE9SX1NUT1B9ICR7MX1fSVBW
Nl9UTVAgJHsxfV9JUFY2IgogICAgZWNobyAtZSAiJHtDT0xPUl9DT0RFfSRJUFNFVCBkZXN0
cm95JHtDT0xPUl9TVE9QfSAkezF9X0lQVjZfVE1QXG4iCiAgIGZpCiAgZmkKICAkSVBTRVQg
c3dhcCAiJHsxfV9JUFY0X1RNUCIgIiR7MX1fSVBWNCIKICAkSVBTRVQgZGVzdHJveSAiJHsx
fV9JUFY0X1RNUCIKICBpZiBbICIkSVBWNl9MT0FERUQiID09IDEgXTsgdGhlbgogICAkSVBT
RVQgc3dhcCAiJHsxfV9JUFY2X1RNUCIgIiR7MX1fSVBWNiIKICAgJElQU0VUIGRlc3Ryb3kg
IiR7MX1fSVBWNl9UTVAiCiAgZmkKICBpZiBbICIkMiIgPT0gMSBdOyB0aGVuCiAgICRJUFNF
VCAtdGVyc2UgbGlzdCAiJHsxfV9JUFY0IgogICBpZiBbICIkSVBWNl9MT0FERUQiID09IDEg
XTsgdGhlbiBlY2hvICcnOyAkSVBTRVQgLXRlcnNlIGxpc3QgIiR7MX1fSVBWNiI7IGZpCiAg
ZmkKIGVsc2UgZWNobyAtZSAiXG4kKGRhdGVfdGltZSlcZVszMW1FUlJPUjpcZVswbSBmaWxl
ICckRklMRScgbm90IGZvdW5kXG4iID4gJy9kZXYvc3RkZXJyJzsgZmkKfQo=
--------------D893F889BD536F4FC101DE6E--
