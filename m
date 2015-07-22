From: Thomas Delrue <thomas.delrue@fundamental-software.net>
Subject: Re: Creating, editing, removing rules from C(++)
Date: Wed, 22 Jul 2015 09:39:55 -0400
Message-ID: <55AF9D2B.9050904@fundamental-software.net>
References: <55AEBC86.5010604@fundamental-software.net> <20150721191535.5002ff3a@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150721191535.5002ff3a@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

This is great info, thanks for helping me out, everyone :)

On 07/21/2015 07:15 PM, Neal P. Murphy wrote:
> On Tue, 21 Jul 2015 17:41:26 -0400 Thomas Delrue
> <thomas.delrue@fundamental-software.net> wrote:
> 
>> Hi,
>> 
>> Is there a way to interact with the firewall rules from a C(++)
>> program? What I'm really trying to do is have a program that only
>> allows a certain set of CIDRs through the firewall through a
>> particular port. However these CIDRs change from time to time and
>> so my application is there to update the firewall rules to make
>> sure that the firewall rules contain the latest and greatest
>> information that says: "drop everything trying to connect to port
>> P EXCEPT for stuff originating from these CIDRs".
> 
> It seems in your case that you don't need high performance or high
> efficiency, so you should be able to use system() to run
> iptables-restore.
> 
> Considering the vagaries of writing a C/C++ program to manipulate
> netfilter directly (it can be done, but isn't necessarily
> straightforward and the API can change for various reasons now and
> again), and considering that your CIDRs only change from time to
> time, you may find it easier to pipe the changes to
> iptables-restore.
> 
> The idea below is conceptual; it's close but may not be
> syntactically correct and you may want packet identification to be
> more solid. It should be enough to point you in the direction of
> least resistance.
> 
> The permanent F/W config might be something like: ---- ... -N
> restrict_1234 -A restrict_1234 -p tcp -m state --state ESTABLISHED
> \ -j REJECT --reject-with tcp-reset -A restrict_1234 \ -j REJECT
> --reject-with icmp-admin-prohibited ... -A FORWARD -p tcp -port
> 1234 -j restrict_1234 -A FORWARD -p udp -port 1234 -j
> restrict_1234 ... ---- On firewall setup, the default is to
> prohibit all conns to port 1234; your daemon will change this when
> it starts.
> 
> When the CIDRs change or when your daemon starts, you could pipe
> something like the following to iptables-restore: ---- -F
> restrict_1234 -A restrict_1234 -s CIDR-A -j RETURN -A restrict_1234
> -s CIDR-B -j RETURN -A restrict_1234 -p tcp -m state --state
> ESTABLISHED \ -j REJECT --reject-with tcp-reset -A restrict_1234 \ 
> -j REJECT --reject-with icmp-admin-prohibited ---- (I don't
> remember if iptables-restore reads from STDIN; if not, use a temp
> intermediate file.) iptables-restore will perform the work
> atomically. The "-j RETURN" allows your remaining rules to handle
> the conn; it might not be wise to ACCEPT packets here, but this
> depends on your firewall design.
> 
> You definitely want to reset existing TCP conns; but you can DROP
> new conn attempts instead of REJECTing them.
> 
> One moment, the existing allowed CIDRs are connecting and talking.
> The next moment, new allowed CIDRs can connect and talk, existing
> conns from still-allowed CIDRs continue talking, conns from
> no-longer-allowed CIDRs are immediately disconnected (one side at a
> time, when the next packet comes in, not one more packet passes
> through the firewall), and new conn attempts from disallowed CIDRs
> are rejected. This method works very well when using the time
> module; one moment the kids are playing their online games and the
> next moment they are disconnected and cannot reconnect. And it
> works for TCP and UDP.
> 
> You *can* write a C/C++ interface to netfilter. But it's often
> better, easier, and clearer to use existing utilities. Especially
> when the task isn't too involved and performance and efficiency
> aren't all that critical (i.e., "... CIDRs change from time to
> time..." doesn't seem to require highly efficient code).
> 
> N
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCgAGBQJVr50rAAoJEDZWLDUW2nDQhhMQAMZFIvZfLdIeCrs3KYCWOf0u
aegqzHvjkO3ADcsxy6g6Ln2j4tHhDBF6Ug+RNb0VXDM83o+9MBvatfihM6EkW1r9
LagNU9mtrLmbMDrX6qYTP6XYRDfgmOv5eHIlsDftNmOUw5LbFlahgr73Gzu6Fmr/
J1hJS4xttwxssVkbP3N4nElw8mIR9Bg1XO2modG+NJAAwbmsPs59mqNOJRNEveWX
SlkVrSkaLDUKiEQfjtOfmzj93x6DPB2QIPx2SOEuZUqecJn7w5MtG1Bi808IDGP5
/7rbOJxKrPxos1I0u6iJ5rD7Oa2/JaonSlPElDNCWp/3okFnLf/MGN1k4biW7XBf
dJ41M3p4iWlJMq4GvDCZoGHcscIe7Q8251/ffisiBBnxsoXrgXCcK2JWYK/+Fp/n
gI8k31Y6CpCdsGfxjG++E0rKwFAzcor71G+qvUUv6SpMuzLzJIVhJj4MWmvbh/NI
vw1qaKXy1yCqCQ16E5JkPhKgZlIk+9ldGME5xLsFepf78hSeYsjdLpG4raMxQjm1
Qfg6bSpgPT0M/Vt/kME/+um+KiQuBzqmptZwNM8iHhGEgex++QKUH87Q5KCCdZhL
WIOXpuMwBdSoqp3xjYWSvm96d7nfQ8egTvnlgdP7iHTuLUam1Jh5bSdlAB9opFzq
iN58tScU2TgilZHZPMis
=gRY6
-----END PGP SIGNATURE-----
