From: Simone Zaffalon <zaffa@zaffa.it>
Subject: conntrackd: failover problems
Date: Mon, 27 Dec 2010 15:50:52 +0100
Message-ID: <AANLkTi=7BfQS07kPJyN_NO45apW-UsMZj-PUgnfboCpb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=OEVW+RfHOY4Skk0fw/x0N7YR0pIYmlEZiGlPPzYrSFk=;
        b=VP/nhi8+/RGe65L760/RarxTBG1nhnT/Twx1D9QsNLQZOh2MqSAIuaI/4WEIWKFCE4
         k0pw4nu1VYXBlNG2Sv2lMfab7qV0j/RKtqXofkZ2xr6FZ1ZO1xXcya5Unng00WEIt/O7
         3Ea9uQsjQ4LZhTdj0LH+DXmOcT7azfIwR2LSo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi.
I'm trying to set-up an HA firewall with Debian, ucarp and conntrackd
in a testbed.
Debian is version 5.0.7 (stock kernel 2.6.26).

I have two hosts in active/passive configuration. At the moment i
don't have any particular firewall rule in place, only a couple of
iptables statements to nat clients ips and let them connect to
internet:
iptables -t nat -A POSTROUTING -s state --state
NEW,ESTABLISHED,RELATED -p TCP -s $internal_lan -d 0/0 -j SNAT --to
source $ext_fw_ip
iptables -t nat -A POSTROUTING -s state --state
NEW,ESTABLISHED,RELATED -p UDP -s $internal_lan -d 0/0 -j SNAT --to
source $ext_fw_ip

Conntrackd is installed and conntrackd -s report no error in multicast traffic.
Anyway i'm not able to keep the sessions active between failovers.
I can see connections in cache external, but it seems that such
connections are not committed.
[Mon Dec 27 02:01:19 2010] (pid=2032) [notice] initialization completed
[Mon Dec 27 02:01:19 2010] (pid=2041) [notice] -- starting in daemon mode --
[Mon Dec 27 02:08:39 2010] (pid=2481) [notice] committing external cache
[Mon Dec 27 02:08:39 2010] (pid=2481) [notice] Committed 1 new entries
[Mon Dec 27 02:08:39 2010] (pid=2483) [notice] committing external cache
[Mon Dec 27 02:08:39 2010] (pid=2483) [notice] Committed 0 new entries
[Mon Dec 27 02:08:39 2010] (pid=2483) [notice] 1 entries can't be committed
[Mon Dec 27 02:08:39 2010] (pid=2041) [notice] flushing caches
[Mon Dec 27 02:08:39 2010] (pid=2041) [notice] resync with master table
[Mon Dec 27 02:08:39 2010] (pid=2041) [notice] flushing caches
[Mon Dec 27 02:08:39 2010] (pid=2041) [notice] resync with master table

As far as i understood, with this sequence of commands:
in master
conntrackd -n

in backup
conntrackd -c
conntrackd -f
conntrackd -R

i should have the same sessions in master and backup (listed with
conntrack -L) or am i totally wrong?

Is there any way to increment log verbosity to understand what's going on?
I really don't know well the internals of conntrackd: am i missing
something? Kernel parameters? sysctl settings?

Many thanks in advance
Regards
Simone Zaffalon
