From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: fake ping reply
Date: Thu, 4 Sep 2003 12:24:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030904162444.GB31513@cannon.eng.us.uu.net>
References: <20030902165026.2edc8dfd.i.kuten@sam-solutions.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030902165026.2edc8dfd.i.kuten@sam-solutions.net>
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
To: "I.S.Kuten" <i.kuten@sam-solutions.net>
Cc: netfilter@lists.netfilter.org

On Tue, Sep 02, 2003 at 04:50:26PM +0300, I.S.Kuten wrote:

> Hello ,
> 
> i wanted to setup iptables , when someone pings my box , echo-reply
> would come from other machine then mine .

A very strange question. When the client sends you a echo-request, it
expects to receive echo-reply from the same IP address. If some other
IP address sends the echo-reply, it will simply get dropped by the OS
on the client, as there is no match for this bogus packet...

Now, what do you want to achieve with this? Fool the client that his
ping, pinged someone else??

If you feel unconfortable with someone pinging you, just drop them...

Ramin

> 
> I've tried to play with PREROUTING & POSTROUTING chains but had no success .
> 
> Anyone has solution ?
> 
> 

