From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Iptables and ActiveX
Date: Tue, 25 Apr 2006 22:01:28 +0200
Message-ID: <001901c668a3$0ab882a0$0101000a@sterenborg.info>
References: <20060425193750.GB16312@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060425193750.GB16312@localhost.localdomain>
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
To: 'Alex 'LaoTseu' DE DOMMELIN' <netfilter@laotseu.org>, netfilter@lists.netfilter.org

> Hi.
> 
> I've got some problems with a web based application using some
> ActiveX and iptables. My app is in a DMZ and should be accessible
> through the port 81. 
> It works well (is see the login page, 100% HTML) but the next
> page which
> contains activeX doesn't work.
> There's no log about something blocked by the firewall.
> 
> Any idea or hint ?

I'm pretty sure that iptables is not causing your ActiveX control to
fail, as an ActiveX control only runs on Windows and iptables/netfilter
only on Linux.
Unless it uses some network connection that you didn't add a rule for to
allow it.


Gr,
Rob


