From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: can't load the script
Date: 09 Jan 2003 10:47:21 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042089449.810.14.camel@india>
References: <003401c2b796$b27ae0d0$4900a8c0@knitting.leahander.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003401c2b796$b27ae0d0$4900a8c0@knitting.leahander.com>
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
To: Gary Lee <gary@leahander.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Check 
#which iptables
if not found
#find / -name iptables

It should say where is your iptables executable.If you found the
executable change the path of the script to which you have found. Else
install the iptables.


>  
>  
-- 
Dharmendra.T
Linux Enthu


