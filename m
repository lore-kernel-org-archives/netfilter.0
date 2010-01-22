From: Konrad Toczylowski <konrad@fortresstech.com>
Subject: iptables 1.4.1.1 crashes
Date: Fri, 22 Jan 2010 17:16:34 -0500
Message-ID: <858674E1611627429CE61D346422273E0B6DA0B2DC@fnexch1.fortresstech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi .

I am having problems with iptables and ip6tables coring.

Here is a sample of the glibc messages:
*** glibc detected *** ip6tables-restore: double free or corruption (!prev): 0x00451088 ***
*** glibc detected *** ip6tables: corrupted double-linked list: 0x00452f90 ***
*** glibc detected *** iptables: corrupted double-linked list: 0x004aafd8 ***
*** glibc detected *** ip6tables: corrupted double-linked list: 0x00452f90 ***
*** glibc detected *** ip6tables: corrupted double-linked list: 0x00451fb8 ***
*** glibc detected *** iptables-restore: double free or corruption (!prev): 0x004a9088 ***
*** glibc detected *** ip6tables-restore: double free or corruption (!prev): 0x00451088 ***
*** glibc detected *** ip6tables: free(): invalid pointer: 0x00452018 ***
*** glibc detected *** ip6tables: corrupted double-linked list: 0x00451fd8 ***
*** glibc detected *** iptables-restore: free(): invalid pointer: 0x004af068 ***
*** glibc detected *** iptables: double free or corruption (!prev): 0x004aefd8 ***
*** glibc detected *** ip6tables-restore: double free or corruption (!prev): 0x00455088 ***
*** glibc detected *** ip6tables: free(): invalid pointer: 0x00456018 ***
*** glibc detected *** ip6tables-restore: double free or corruption (!prev): 0x00455088 ***
*** glibc detected *** ip6tables: corrupted double-linked list: 0x00456f90 ***
*** glibc detected *** ip6tables-restore: double free or corruption (!prev): 0x00455088 ***

I have seen more from iptables as well. All of these are from do_commit().

There seems to be nothing wrong with the input - the same iptables command that cored once, usually works the second time if repeated
I tried to look for potential fixes in release notes for later versions, but I have not noticed any references of fixing problems I am seeing.
BTW. We are using mips-linux distribution from miips-linux.org

Any help is appreciated.

Thank you,
Konrad

