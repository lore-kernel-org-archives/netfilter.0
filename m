From: Ruprecht Helms <rhelms@mymail.ch>
Subject: Re: Preventing port scanning using iptables ?
Date: Sat, 05 Aug 2006 09:14:52 +0200
Message-ID: <44D4456C.5050203@mymail.ch>
References: <20060805062309.43523.qmail@web56213.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060805062309.43523.qmail@web56213.mail.re3.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Elvir Kuric <omasnjak@yahoo.com>
Cc: netfilter@lists.netfilter.org

Elvir Kuric schrieb:
> Hi all, 
>  I am trying to implement proper firewall to my
> network using iptables 
> and I  have to admit that I am amazing by amount of
> iptables features 
> it offers.
>  But I can not understand is there any way to prevent
> port scanning 
> using iptables? 

Yes by checking the tcp-flags. The connections are not established
because only the port is checked if it is reachabele.

Regards,
Ruprecht

-------------------------------------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung
             let worktools be individual

Web: http://www.rheyn.de

