From: Venkateswaran Narayanan <hareaswar@gmail.com>
Subject: EBTABLES not working on the target after cross compilation.
Date: Fri, 23 Dec 2011 13:43:10 +0530
Message-ID: <CA++1oEOcp9zbE0V2E31FPBf83BSZFdPCXbKkTc=yGZ=-W6wZxA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=ML9n0r/gdpLq5Oa+CU+L3jHbPEVqvxhzFETtOMt6tHw=;
        b=Gb9hTQRD37pBxn60gD+3pMHDhr8ErL1HSpIwJEN/jJzVkCcTv0Lr1ehjt/WJb14bnZ
         rNHm1qAf8nDSPAzdmI4eUQFBzvaQWFooOsf4DRHHBZVF1CxD+R4h2fMGKbcZljHyAsyJ
         gWPviNC5UVje2IsrgGumx7ndlfQ1Rtrf464Js=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Friends,

I cannot find older threads which dealt with similar problem, if any
thread exists I apologize.
This is my problem.
When I try to execute the command "ebtables -A FORWARD -p IPv4
--ip-src 172.16.1.4 -s ! 00:11:22:33:44:55 -j DROP" (I take this
command from one of the example in ebtables website.) I am getting the
following error message.
Unable to update the kernel. Two possible causes:1. Multiple ebtables
programs were executing simultaneously. The ebtables=A0 =A0userspace to=
ol
doesn't by default support multiple ebtables programs running
concurrently. The ebtables option --concurrent or a tool like flock
can be=A0 =A0used to support concurrent scripts that update the ebtable=
s
kernel tables.2. The kernel doesn't support a certain ebtables
extension, consider=A0 =A0recompiling your kernel or insmod the extensi=
on.
Details on Platform:
1. I have cross compiled ebtables v2.0.10-2 by removing the codes
parts which are corresponding to IPv6. (The target I am using does not
support IPv6 features). The compilation was successful and I can see
the ebtables executables.
2. I have the following modules available in the
/lib/modules/net/bridge/netfilter directory of my target:

=A0ebt_802_3.ko =A0 =A0 =A0 ebt_dnat.ko =A0 =A0 =A0 =A0ebt_mark.ko =A0 =
=A0 =A0 =A0ebt_snat.ko
 =A0 =A0 =A0ebtable_broute.koebt_among.ko =A0 =A0 =A0 ebt_ip.ko
ebt_mark_m.ko =A0 =A0 =A0ebt_stp.ko =A0 =A0 =A0 =A0 ebtable_filter.koeb=
t_arp.ko
 =A0 ebt_limit.ko =A0 =A0 =A0 ebt_pkttype.ko =A0 =A0 ebt_ulog.ko
ebtable_nat.koebt_arpreply.ko =A0 =A0ebt_log.ko =A0 =A0 =A0 =A0 ebt_red=
irect.ko
ebt_vlan.ko =A0 =A0 =A0 =A0ebtables.ko
3. The ebtable kernel components are compiled as modules.
4. The filesystem of the platform is read only. The /var partition
with some small size is readable although.
5. Before trying the execution of the command, I did insmod for all
the modules listed above.
Please assist me to get the issue resolved, I am a newbie to ebtables.
Thanks in Advance

CheersVENKATESWARAN
Bug the Bugs
