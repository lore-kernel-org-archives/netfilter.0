From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: some web sites need more than port 80?....
Date: Sun, 06 Mar 2005 18:33:09 +0100
Message-ID: <422B3ED5.9040207@lopsch.com>
References: <20050306164509.GA15342@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050306164509.GA15342@spawar.navy.mil>
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
To: netfilter@lists.netfilter.org

seberino@spawar.navy.mil schrieb:
> I locked down my laptop with a firewall script to only
> allow port 80.
> 
> I noticed that only the text gets downloaded from ucsd.edu.
> 
> It seems that the graphics from ucsd.edu could not get
> 
> through my firewall.
> 
> 
> Do webs sites now send JPEGs in parallel with the text
> on a different port or something?
> 
> 
> chris
> 
> 

Take a look at the source code of the page. Perhaps it references the 
images from another webserver running on another port.

