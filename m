From: Jason Opperisano <opie@817west.com>
Subject: Re: Let me understand *RETURN*
Date: Fri, 18 Feb 2005 19:40:09 -0500
Message-ID: <1108773609.4767.1.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.05.10502181857270.12098-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.05.10502181857270.12098-100000@darkstar.sysinfo.com>
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

On Fri, 2005-02-18 at 18:59, R. DuFresne wrote:
> It was my understanding that a user chain could not jump to another user
> chain, that this was only allowed in the default chains <input, output and
> forward>?

nope.  jump all you want--just don't always expect to be able to figure
out WTF your packet went.

-j

--
"Ahh the Luftwaffe--the Washington Generals of the History Channel."
	--The Simpsons


