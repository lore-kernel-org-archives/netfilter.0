From: Doc Nielsen <WebMaster@DocNielsen.dk>
Subject: Re: ip_tables.o not loading - nf_unregister_sockopt error [FIXED]
Date: Mon, 8 Sep 2003 14:46:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309081446.36345.WebMaster@DocNielsen.dk>
References: <000501c37184$d6701fc0$7b01a8c0@Doc> <1063001214.960.33.camel@india.nsecure.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063001214.960.33.camel@india.nsecure.net>
Content-Disposition: inline
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
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: netfilter@lists.netfilter.org

On Monday 08 September 2003 08:06, Dharmendra.T wrote:
> On Wed, 2003-09-03 at 00:33, Doc Nielsen wrote:
>>
>>     hey guys
>>
>>     Im having some trouble compiling and using iptables/netfilter
>>     Its enabled in the kernel, and the modules are there, but when I try to
>> load them I get this:
>>
>>     root@server:~# modprobe ip_tables
>>     /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: unresolved
>> symbol nf_unregister_sockopt
>>     /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: unresolved
>> symbol nf_register_sockopt
>>     /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: insmod
>>     /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o failed
>>     /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: insmod
>> ip_tables failed
>>
>>     What am I doing wrong?
>>
>>     Please CC mail directly to me, as Im not subscribed to the list.
>>     And yes, I have browsed the archives with no luck.
>>
>>     - Doc
>
>     Could you tell me how you have compiled your kernel?

It's the debian kernel-source-2.4.20.deb
make menuconfig && make dep && make bzlilo modules modules_install

A complete recompile solved the problem, or went around it...

cp /usr/src/kernel-source-2.4.20/.config /usr/src/config.txt
rm -rf /usr/src/kernel-source-2.4.20 
tar xjf kernel-source-2.4.20.tar.bz2
cp /usr/src/config.txt /usr/src/kernel-source-2.4.20/.config
cd /usr/src/kernel-source-2.4.20/
make menuconfig && make dep && make bzlilo modules modules_install

- Doc


