From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: blocking irc + botnets
Date: Tue, 02 Aug 2005 18:55:39 +0200
Message-ID: <42EFA58B.6000207@lopsch.com>
References: <bc5becf6050802084137a7ad69@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bc5becf6050802084137a7ad69@mail.gmail.com>
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

hbeaumont hbeaumont schrieb:
> Can anyone help me with the proper method to block outgoing requests to 
> botnets + irc?
> 
> Or point me in the direction of searchable list archives (I could only find 
> the non-searchable archives) or other FAQ that answers this?
> 
> Problem:
> 
> We have servers that could get infected via poorly wrote user scripts. I 
> want to prevent these servers from being used as part of botnets or general 
> connections to 
> IRC (most scripts I run across seem to try to connect to IRC). I want to 
> take the best preventative measures I can in case one of the machines would 
> become infected
> or otherwise compromised.
> 
> Also, interested in any other popular method of stopping general outgoing 
> DOS attacks (rate limiting UDP perhaps? I'm not real up on the techniques 
> used by the DOS'ers).
> 
> I'm interested in the recommended rules to add to prevent this type of thing 
> should it occur. Thanks.
> 
> 
You should block the appropriate IRC portrange. Additionally you could 
mark IRC packets with l7 matching and then drop them afterwards. I think 
this will filter pretty much of the IRC traffic, perhaps all.

