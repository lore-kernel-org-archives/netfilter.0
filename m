From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Re: ULOG: invalid argument
Date: Fri, 5 Mar 2004 18:44:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040305174440.GB8522@freenet.de>
References: <BAY15-F22EuZFkTEPcO000027e1@hotmail.com> <Pine.LNX.4.33.0403051059070.6328-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0403051059070.6328-100000@blackhole.kfki.hu>
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

Am 2004-03-05 11:01:18, schrieb Jozsef Kadlecsik:
>On Fri, 5 Mar 2004, T. Take wrote:

>> As you explained to me, I have made the version of ulogd up to 1.02.
>> # apt-get build-dep ulogd
>> # .....
>> # apt-get -b source ulogd
>>
>> But, I cannot use target "ULOG".
>> # iptables: Invalid argment (the same error)
>
>Please make sure there is no iptables binary from your distribution which
>precedes in PATH the iptables binary installed from source.

This is not possibel, because he use the Debian nativ-system.
;-)

...he has not written that he has used 

apt-get install ulogd
;-)

whitch will replace the originating version.

>Best regards,
>Jozsef

Greetings
Michelle

-- 
Registered Linux-User #280138 with the Linux Counter, http://counter.li.org/ 

