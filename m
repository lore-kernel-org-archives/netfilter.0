From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: RE: I thought ssh is port #22 ?!!
Date: Thu, 01 Apr 2004 20:27:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080844053.26229.111.camel@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF567928A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF567928A@alderaan.smgtec.com>
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

tor, 01.04.2004 kl. 19.20 skrev Daniel Chemko:

> > Here's how it works. The server listens on port 22. The client opens a
> > connection to the server, and tells the server which return port to use.
> > If you do "netstat -an" you will see the server talking on port 22, and
> > the client talking on some high numbered port like 32873. The high
> > number port used is random. It will change from one session to the next.
> >
> > This is true not just for ssh - it is true for most tcp applications.

> Unfortunately I have the "privilage" of maintaining a customer TCP
> protocol which cans you if your source and destination ports aren't as
> specified by their fcked up protocol!!

Nevertheless, that's how TCP works, for every customer in the Universe.
Sack your customer, and get another?.

It would be better if you learned not to top post and to quote
correctly.

--Tonni

-- 

mail: billy - at - billy.demon.nl
http://www.billy.demon.nl


