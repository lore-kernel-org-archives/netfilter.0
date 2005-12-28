From: "Richard Pickett" <Richard.Pickett@CSRTechnologies.com>
Subject: RE: Forward specific port to another ip
Date: Tue, 27 Dec 2005 23:13:25 -0600
Message-ID: <005b01c60b6d$70c55840$1101a8c0@quebec>
References: <65aa6af90512271255g1d90b33eg50a61f08ca16ce3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af90512271255g1d90b33eg50a61f08ca16ce3b@mail.gmail.com>
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

> Remember I said "for starters". You have to consider more things in
> order to make it work... depending on your networking environment. :-)
> 
> On 12/27/05, Richard Pickett <Richard.Pickett@csrtechnologies.com>
wrote:
> > Here's something to keep in mind on NAT, it only works if the NAT
box is
> > in-between both systems or you can double-NAT.

I wasn't addressing the completeness or lack of completeness of your
post at all.

I was addressing the post where Andy notes his telnet hangs. If the two
systems have direct routes he would need to double nat, and that's what
I was pointing out to him.


