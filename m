From: Steve Brown <sbrown25@gmail.com>
Subject: can't use MARK target
Date: Thu, 27 Aug 2009 09:44:07 -0500
Message-ID: <1f4ef0970908270744x941cc84i3e85cb2600325d3a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=vJzOcc+Ez7Ysa9r8tk62GXpAEWhogW8OYVmfTCFvxaU=;
        b=T22kQ4J2SbQjst3YyMEju/lC3WziTzx3aD/H/7r80NX4ZOAeGTE/tNCL/DSMdutJdt
         wxLSnDNtEo0UKlisiG11NOyS7lw6/C+e1iLnCLaEqQjVRzBVpkoDLs1kahNpEkgd8p+N
         6DezpoxBCLCZ0HCuMtDGfDic+gNpdlbBbfpcM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm trying to use iptables to mark some packets for later use.  The
command should be pretty simple:

iptables -t mangle -A PREROUTING -p tcp --dport 22 -j MARK --set-mark 1

When I try to issue the command, I get:

iptables v1.4.4: Couldn't load match
`MARK':/usr/local/libexec/xtables/libipt_MARK.so: cannot open shared
object file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.

The MARK and connmark kernel modules are loaded, and I've rebuilt
iptables from source a couple of times, but I cannot figure out why it
won't build the MARK support module?  Any gotchas I should be aware
of?
