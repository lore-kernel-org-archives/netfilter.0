From: Vladimir Ondrus <vladimir.ondrus@gmail.com>
Subject: conntrack full with TIME_WAIT on tcp passive close site
Date: Mon, 6 May 2013 19:14:01 +0200
Message-ID: <CA+WDh75vQ1yPeM8KMPhs4yKgK0apeVUvmvTPUxFjCgcKp6P0qg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=IiGzMU2z9dn6rvWN6o6ZP9asEzvXN1Obllrbh4LsvLc=;
        b=Al6VxynxElJ/Cml+GIQaDwO7S1nea4dKiqYK9fAuTNXNnvTfF9CmcQCam6VmtMKUG/
         sHxDDKptAIAAJSMtDmwmFrnRaWQ4/dQRU5DJTmJGFha6PhV2ikZZjrjsVzncdofVYuil
         vE3AH1pEpRzpWYri6s/w8F2Ir2IiADu1pqVyyL7Zzdx/pIQ3Zn62Uepb6j9HSRuhywRD
         zMarIzd9wyY9L4wQ5uEM5W2wU4u/tjdYkWBaQsH5ieL1cvJ4dmqY/9XfEwIoizUbUZKn
         9xcQP091tQxdUb7RYNBiCxCqdkVqlrFwZ7Grm+bFI2rBslVU4NCxk7bkOnPdpXncMwpG
         bTRA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

We have a setup with many tcp connections, which are after short time
activelly closed from remote site.
However we have our nf_conntrack table full with connections in TIME_WAIT state.
Output from netstat shows no connection in TIME_WAIT state, which we
think is correct, because we are passive close site, so connection
should not go through TIME_WAIT state.

Why tcp connection in conntrack table goes through TIME_WAIT, even we
are pasive close site in tcp?

Regards,
Vladimir Ondrus

suf-ins:~ # uname -a
Linux suf-ins 3.0.58-0.6.6-default #1 SMP Tue Feb 19 11:07:00 UTC 2013
(1576ecd) x86_64 x86_64 x86_64 GNU/Linux
suf-ins:~ # lsmod | grep conntrack
nf_conntrack_ipv4      14856  4 iptable_nat,nf_nat
nf_conntrack           91963  4 xt_state,iptable_nat,nf_nat,
nf_conntrack_ipv4
nf_defrag_ipv4         12729  1 nf_conntrack_ipv4
suf-ins:~ # modinfo nf_conntrack
filename:
/lib/modules/3.0.58-0.6.6-default/kernel/net/netfilter/nf_conntrack.ko
license:        GPL
srcversion:     BAAB16A923443DCF4CD66A3
depends:
supported:      yes
vermagic:       3.0.58-0.6.6-default SMP mod_unload modversions
parm:           tstamp:Enable connection tracking flow timestamping. (bool)
parm:           acct:Enable connection tracking flow accounting. (bool)
parm:           expect_hashsize:uint
suf-ins:~ #
