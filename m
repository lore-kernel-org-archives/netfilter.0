From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: some web sites need more than port 80?....
Date: Mon, 7 Mar 2005 13:56:23 +0200
Message-ID: <1403218a0503070356fa8b6a9@mail.gmail.com>
References: <20050306164509.GA15342@spawar.navy.mil>
	<422B3ED5.9040207@lopsch.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <422B3ED5.9040207@lopsch.com>
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
To: Daniel Lopes <lopsch@lopsch.com>, netfilter <netfilter@lists.netfilter.org>

What are you blocking here ???
You talk to the webservers on port 80, but your local ports are not 80
for sure !!!
Actually, you should only blocking incoming packets to you, which are
new connections !!


On Sun, 06 Mar 2005 18:33:09 +0100, Daniel Lopes <lopsch@lopsch.com> wrote:
> seberino@spawar.navy.mil schrieb:
> > I locked down my laptop with a firewall script to only
> > allow port 80.
> >
> > I noticed that only the text gets downloaded from ucsd.edu.
> >
> > It seems that the graphics from ucsd.edu could not get
> >
> > through my firewall.
> >
> >
> > Do webs sites now send JPEGs in parallel with the text
> > on a different port or something?
> >
> >
> > chris
> >
> >
> 
> Take a look at the source code of the page. Perhaps it references the
> images from another webserver running on another port.
> 
> 


-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

