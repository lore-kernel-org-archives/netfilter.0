From: "Shaun T. Erickson" <ste@smxy.org>
Subject: Re: idle timeout question
Date: Thu, 19 Aug 2004 17:28:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41251B8D.2020604@smxy.org>
References: <D5C9032B2B09C64EA2409D6214E91AC90512AD@asimail2.alphanumeric.com>
Reply-To: ste@smxy.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512AD@asimail2.alphanumeric.com>
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
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:

>>What is the default idle timout on tcp connections passing through an
>>iptables firewall? If it's modifiable, on a rule by rule basis, how do I
>>do that, and what is the maximum timeout that I can set?
> 
> 
> short answer:  5 days
> 
> long answer:  check out "Table 4-2. Internal states" at:
>   http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TCPCONNECTIONS
> 
> modifiable rule-by-rule?  i do not believe so...
> 
> maximum?  whatever the max value of an unsigned long integer is on your platform--probably something bigger than would be sane to use (4294967295 comes to mind)...

Thanks.

	-ste

