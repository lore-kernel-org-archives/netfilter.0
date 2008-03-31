From: Steven Stromer <filter@stevenstromer.com>
Subject: possible bug in call to libipt_state
Date: Mon, 31 Mar 2008 16:12:10 -0400
Message-ID: <filter-4B6EC6.16121031032008@ger.gmane.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

On FC8, kernel 2.6.24.3-50.fc8 (and earlier, actually), iptables v1.3.8, I am receiving the following error when trying to load rules from a shell script:

Couldn't load match '-state':/lib64/iptables/libipt_-state.so: cannot open shared object file: No such file or directory

In fact, there is no such file or directory, because the call is being incorrectly made to 'libipt_-state.so', instead of 'libipt_state.so':

# ls -la /lib64/iptables | grep state
-rwxr-xr-x 1 root root  6888 2007-11-05 12:08 libip6t_state.so
-rwxr-xr-x 1 root root  6888 2007-11-05 12:08 libipt_state.so

I am not at all certain whether this is a problem in the Fedora iptables package, the kernel, or iptables itself. If anyone could help me locate the source of the call, and could also confirm that this really is a bug, I'll happily report it!

Thanks,
Steven Stromer

