From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Re: ULOG: invalid argument
Date: Fri, 5 Mar 2004 19:14:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040305181437.GE8522@freenet.de>
References: <20040305174440.GB8522@freenet.de> <Pine.LNX.4.33.0403051850020.7353-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0403051850020.7353-100000@blackhole.kfki.hu>
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

Am 2004-03-05 18:51:06, schrieb Jozsef Kadlecsik:
>On Fri, 5 Mar 2004, Michelle Konzack wrote:
>
>> >> # iptables: Invalid argment (the same error)
>> >
>> >Please make sure there is no iptables binary from your distribution which
>> >precedes in PATH the iptables binary installed from source.
>                        ^^^^^^^^^^^^^^^
>
>> This is not possibel, because he use the Debian nativ-system.
>> ...he has not written that he has used
>> apt-get install ulogd
>                  ^^^^^

False, you have overread the line above...
He has done an 

apt-get build-dep ulogd
apt-get -b source ulogd

which I was talking about. The 'iptables' from WOODY are working fine

Maybe he has gorgotten to install it ;-)

Like me  =8<O

If you use the iptables-HOWTO and try the Target 'ULOG' it does not 
work, because the version of Debian GNU/Linux WOODY is to old. There 
is a lib missing. So you need to compile the source from SID which 
is the latest version of 'ulogd' and understand the options you give 
the Target 'ULOG'.

>> whitch will replace the originating version.
>
>Best regards,
>Jozsef

Greetings
Michelle

-- 
Registered Linux-User #280138 with the Linux Counter, http://counter.li.org/ 

