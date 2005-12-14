From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: [iptable] distributing network requests over multiple
	interfaces bysize
Date: Wed, 14 Dec 2005 18:33:01 +0100
Message-ID: <000101c600d4$6ed83e10$0101000a@sterenborg.info>
References: <a23e371d0512131532t7991bf1ck935ec9e66d165f52@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a23e371d0512131532t7991bf1ck935ec9e66d165f52@mail.gmail.com>
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

> Basically, I would like for all small requests (normal web browsing)
> to be directed to eth0:1 and for all requests for large files to be
> directed to eth0. 
> 
> Is there a way to balance these two connections in this way?  It seems
> like a spectacularly good idea to me, if I could just figure out how
> to make it work.  Do I want to be looking at iptables to do this?  Or
> can I do something in squid? 

*If* it can be done, you'd need a content-filter and netfilter/iptables
isn't one.
For netfilter there's no way of knowing if a request is a normal
web-page request or a file request ; all requests go to port 80 and all
are GET requests.

Maybe with squid you can check the file-extensions in the GET request
and if it matches : use a different inferface.. But I'm not sure about
this.


Gr,
Rob


