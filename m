From: Andreas Grabner <andi@vnc.at>
Subject: Re: 2 ISPs again
Date: Sat, 11 Dec 2004 14:06:21 +0100
Message-ID: <20041211130621.GA2922@utanet.at>
References: <40842.213.33.127.134.1102705404.squirrel@webmail.vnc.at>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40842.213.33.127.134.1102705404.squirrel@webmail.vnc.at>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi

On Fri, Dec 10, 2004 at 02:20:08PM -0500, Jason Opperisano wrote:
> the trick is to make sure that replies to requests that come in from
> ISP1 go back out ISP1.  dchemko@ seems to be the "connmark master"
> when
> it comes to this stuff--have a look at:
>
>   http://marc.theaimsgroup.com/?l=netfilter&m=108094979204392&w=2

At 23:12 i got it to work with this excelent answer. And it's work for
houres now.

Thanks a lot to Daniel and Jason.

One more thing would be interesting for me:
I have turned of rp_filter is this realy needed? I have not seen (with
wine-red Eyes) any packest comming in the "wrong" interface.

best regards
Andreas Grabner


