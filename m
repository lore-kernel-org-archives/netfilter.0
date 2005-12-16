From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: IPTABLES Forwarding problem
Date: Fri, 16 Dec 2005 14:26:18 +0100 (CET)
Message-ID: <56340.193.173.147.3.1134739578.squirrel@webmail.sterenborg.info>
References: <008f01c60229$7e818550$460aa8c0@misern2>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008f01c60229$7e818550$460aa8c0@misern2>
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

On Fri, December 16, 2005 11:14, Marsal Isern wrote:
> Hi All,
>
>
> I have a rule that redirects  the port 8080 from any external IP
> address to an internal server.
> I have no problem with the majority of clients. The forwading works
> great but I have a problem with only one IP.
> I logged the traffic and the prerouting works great and the forwading
> works but it get stuck with the SYN tcp flag  so the conection is
> never established.
> Logging the traffic form any other IP there is no problem. I can see
> the Syn flag and then the Ack flag ..
>
> I'm sure I'm missing something, but I can not find out a solution

Maybe if we saw the output of "iptables-save" or "iptables -nvL" we
wouldn't have to guess and say something useful.


Gr,
Rob



