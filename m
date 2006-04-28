From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: IP drop question
Date: Fri, 28 Apr 2006 19:06:22 +0200
Message-ID: <000901c66ae6$13a76e40$0101000a@sterenborg.info>
References: <445243B1.3080904@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <445243B1.3080904@uvic.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>> My config does not appear to be dropping unauthorised IPs - in my
>> logwatch file I am still getting lines like:
>> 
>>  Failed logins from:
>>     211.238.253.248: 54 times
>> 
>>  Illegal users from:
>>     202.110.131.27: 1 time
>>     211.238.253.248: 164 times
> 
> I'm not familiar with logwatch.  Are these SSH, telnet, other?  I 
> assume SSH, because new telnet connections are allowed in with 
> this rule:
> 
>> -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 25
>> --syn -j ACCEPT

Huh..? Not to nitpick or anything, but dport 25 is smtp and dport 23 is
telnet. IMHO this rule will not allow telnet.


Gr,
Rob


