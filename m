From: "Randy.Dunlap" <rddunlap@osdl.org>
Subject: Re: kernel modules won't auto load
Date: Thu, 30 Oct 2003 15:48:25 -0800
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20031030154825.70b13a35.rddunlap@osdl.org>
References: <3FA19A2A.3090500@savages.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <3FA19A2A.3090500@savages.net>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shaun Savage <savages@savages.net>
Cc: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

On Thu, 30 Oct 2003 15:09:30 -0800 Shaun Savage <savages@savages.net> wrote:

| I am trying to get kernel 2.6-t9 working on redhat9
| 
| I have downloaded and compiled, and installed the kernel.
| module-init-tools-0.9.15-pre2,
| and iptables-1.2.9rc1
| 
| when I run iptables-restore it dies if I have not loaded the kernel
| modules by hand before.

Did you run generate-modprobe.con (script) to convert your
/etc/modules.conf file to /etc/modprobe.conf ?

--
~Randy
