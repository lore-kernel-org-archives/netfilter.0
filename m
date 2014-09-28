From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: 64-bit kernel, 32-bit user space
Date: Sun, 28 Sep 2014 14:20:06 -0400
Message-ID: <201409281420.06794.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've been pondering building a system that uses a 64-bit kernel with 32-bit 
user space. Building most user space programs should be easy. But those that 
have kernel parts should be a little tricky.

Take iptables, for example. The user space program can be 32-bit. But do the 
kernel modules have to be 64-bit? Would xtables-addons have to be built 64-
bit? Openswan's another that might need to be split: 32-bit pluto and 64-bit 
klips module.

Has anyone here built a 32-bit iptables for a 64-bit kernel? Or do such pkgs 
that provide both user space and kernel space parts have to have both built to 
match the kernel? In the many references I've found, this specific problem 
hasn't been addressed.

Thanks,
N
