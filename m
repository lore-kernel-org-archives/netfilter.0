From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging with INPUT & FORWARD set to DROP
Date: Tue, 9 Mar 2004 10:59:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403091059.54342.Antony@Soft-Solutions.co.uk>
References: <000f01c405c4$06559f20$6a02a8c0@klemen>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000f01c405c4$06559f20$6a02a8c0@klemen>
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

On Tuesday 09 March 2004 10:48 am, Klemen Kecman wrote:

> Is there a way to log packets that get dropped due to default policy set to
> drop.

Sure.   Place a LOG rule at the end of the chain in question.

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


