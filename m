From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: compiling iptables support for other machine
Date: Sun, 4 May 2003 12:39:02 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030504043901.GA1439@floyd>
References: <3EB3A7FD.22A17A1@abc.at>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3EB3A7FD.22A17A1@abc.at>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, May 03, 2003 at 01:29:01PM +0200, Emanoil Kotsev spoke thusly:
>Unfortunately on MA everything is compiling fine - where is the problem
>what do I need for the asm/param.h
>
>Is it enough to compile on MA and to copy the relevant stuff eg. vmlinuz
>+ modules to MB

After you compile the kernel, merely copy over the following files :

- /usr/src/linux-2.4.20/arch/i386/boot/bzImage
- /usr/src/linux-2.4.20/System.map
- /lib/modules/2.4.20/*

to the relevant paths at MB. Most probably /boot/ and /lib/. If you've made
changes to the iptables stuff, copy over the binary + relevant shared
libraries (.so files); those might be in different places. Try the
following paths for starters :

/lib/iptables/
/usr/local/lib/iptables/

If you still can't find it, try doing 'strace /path/to/new/iptables/binary
-L -n', and look for the open() calls to see which library path its looking
at. Reboot && voila :)

