From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Firewall performance querry
Date: Wed, 10 Sep 2003 02:06:13 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030909180613.GA3152@propaganda.localdomain>
References: <20030905062950.M87452@ahm.cmc.net.in> <20030909053404.M44692@ahm.cmc.net.in> <3F5DB160.3080909@chrisbrenton.org>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F5DB160.3080909@chrisbrenton.org>
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
To: netfilter@lists.netfilter.org

On Tue, Sep 09, 2003 at 06:54:24AM -0400, Chris Brenton spoke thusly:

(snip lots)

>SMTP is not too bad as its pretty efficient. 

I think DJB would disagree with you ? :-)

>HTTP is the one that kills you as it spawns a unique concurrent session
>for every object on a web page you try to view. For example a user
>visiting www.netfilter.org generates 6 unique sessions to view the
>homepage. Microsoft's homepage is 10 sessions, Security Focus is 70, you
>get the idea.

If I understand you correctly, that is with HTTP/1.0 which opens up a
unique tuple per object, HTTP/1.1 uses a single tuple only.

(snip again)

