From: Rakotomandimby Mihamina <mrakotom@free.fr>
Subject: Re: sendmail : dport 25 , sport 25 or both?
Date: Thu, 22 Jan 2004 12:50:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401221250.44784.mrakotom@free.fr>
References: <200401220850.27734.mrakotom@free.fr> <1074768174.2002.18.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074768174.2002.18.camel@tarkus>
Content-Disposition: inline
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

On Thursday 22 January 2004 11:42, Ted Kaczmarek wrote:
> If the daemon listens on port 25, then the connection will be destined
> to it on port 25.

yes . 

> So
> Input chain allows destination port 25
> Output chain allows source port 25

OK.

> Do you have a specific need for blocking all output packets?

yes . security reason . i think if someone has succeded intrusion , i could 
block outgoing traffic , so that it would not be easy for him to manage 
it ... is it crazzy ? :-) 

-- 
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina


