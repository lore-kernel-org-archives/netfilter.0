From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: IPs blocked still able to connect
Date: Sun, 13 Jun 2004 13:22:45 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040613132245.07a9fbb7@mgalepc.utilitran.com>
References: <200406122017.i5CKHpnI030899@ylpvm01.prodigy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406122017.i5CKHpnI030899@ylpvm01.prodigy.net>
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
To: netfilter@lists.netfilter.org

Hello,

	You are using "iptables -A" ... this will append this rule to your list. If you
have an accept rule further up that this connection would match then it will be
accepted but it hits this rule.

You should do a "iptables -I" to insert the rule at the top.

Michael.



On Sat, 12 Jun 2004 13:18:15 -0700
"Spiro Azkoul" <spiro@snacorp.net> wrote:

> Hello
> 
> I blocked a subnet by using the following command:
> iptables -A INPUT -s 222.0.0.0/8 -j DROP
> I then saved it to file
> iptables-save > /etc/sysconfig/iptables
> and did an iptables -L INPUT to verify that it is in
> DROP       all  --  222.0.0.0/8          anywhere
> 
> However, i am still receiving SPAM from IPs within that subnet (and others)
> long after I thought I completely blocked them from connecting to my server.
> 
> I am using RedHat 9 with sendmail, no outgoing SMTP allowed. 
> 
> Does anyone have any feedback on this?
> Thank you
> 
> 
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

