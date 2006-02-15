From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: dnat question
Date: Tue, 14 Feb 2006 20:23:00 -0400
Message-ID: <65aa6af90602141623r468e2fb2m47b1b3ebaa3eb7bc@mail.gmail.com>
References: <8161840.1139950088826.JavaMail.jstic04@cp.centennialcollege.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8161840.1139950088826.JavaMail.jstic04@cp.centennialcollege.ca>
Content-Disposition: inline
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

Don't include any port... that should be enough.

iptables -t nat -A PREROUTING -p tcp -j DNAT --to-destination x.x.x.x:80

On 2/14/06, James Edward Stickland <jstic04@cp.centennialcollege.ca> wrote:
> Hello, could someone help me with writing a rule to do the following
>
> All tcp connections on all port numbers 1-65534 be dnat'ed to host
> x.x.x.x on port 80
>
> im setting up a simple honey pot. for new connections coming to my wan
> interface.
>
> i know i could do separate prerouting chain in the nat table entries
> for each port - but how can i do a one liner?
>
>

