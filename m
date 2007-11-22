From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: target extension
Date: Thu, 22 Nov 2007 12:54:57 +0100
Message-ID: <47456E11.1090706@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
I'm looking for an extension that load the ip address from the proc fs,
so there I can set the address that I want to match. Something like:

iptables -A INPUT -m proc_ext --proc_ext_parms -j ACCEPT
cat my_ip_host >> /proc/net/ipt_proc_ext/host

(similar that I can do with the condition extension)

Looking on the net, but found none.


Thanks,
Michele

