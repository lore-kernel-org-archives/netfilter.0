From: Scott Hall <halls@aros.net>
Subject: Re: icmp: 10.1.4.50 unreachable - need to frag (mtu 500) [tos 0xc0]
Date: Tue, 13 Jan 2004 10:52:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40043073.4060704@aros.net>
References: <3FFA5EBD.1000701@aros.net> <1073388187.2047.250.camel@grendel>	 <4003A62B.7020108@aros.net> <1074009062.5742.222.camel@grendel>	 <400418DB.209@aros.net> <1074011912.2048.5.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074011912.2048.5.camel@grendel>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

Here is the iptables -V from both routers.  the 1.2.7a is the my side 
router and the router that the original tcpdump traffic I posted came from.

[root@gandalf root]# iptables -V
iptables v1.2.7a (My side)

[root@indinj root]# iptables -V
iptables v1.2.8 (customer side)

--Scott


Chris Brenton wrote:

>On Tue, 2004-01-13 at 11:12, Scott Hall wrote:
>  
>
>>Thank for the response Chris,
>>    
>>
>
>Glad to!
>
>  
>
>>Are there anyother work arounds that you can propose? 
>>    
>>
>
>Do a:
>iptables -V
>
>I'm guessing you are running an older version that is not patched for
>this problem (1.2.6a or prior). Here is the original advisory:
>http://www.linuxsecurity.com/advisories/other_advisory-2063.html
>
>HTH,
>C
>
>
>
>  
>


