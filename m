From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: rules for skype
Date: Mon, 02 May 2005 09:40:58 -0500
Message-ID: <42763BFA.9030609@riverviewtech.net>
References: <20050501223241.CF7E4103130@correio.solutti.com.br>	<427559CC.9050108@solutti.com.br>
	<42763AE5.1000606@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42763AE5.1000606@lopsch.com>
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

> Yes this 443 port thing is the only reason why it seems that Skype is 
> unstoppable. You could block connections to that port but then you would 
> also cut off https based websites :(.

Would it be possible to ACL via Squid (or the likes) to control what host a client is initiating an SSL connection to?  I have not done much filtering on the application (HTTP) level beyond blocking basic requests for a domain on standard HTTP (80).  I wonder if it would be possible to write an extension for Squid that would not allow connections to IP addresses that don't (forward) resolve back to what they reverse resolve to.  I'm grasping at straws here, but then again Skype is going to be hard to stop.



Grant. . . .

