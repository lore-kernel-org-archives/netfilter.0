From: <bmcdowell@coxhealthplans.com>
Subject: RE: TTL patch buggy?
Date: Thu, 8 Jan 2004 08:32:10 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731014BDF86@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Cedric wrote:
>If you want to prevent discovery based on the TTL of packets you send,
>reset TTL for outbound traffic to a default value such as 64.

I agree.  This is most useful for making it a tad more difficult to =
detect which OS you've chosen.

Also, incrementing the TTL is useful for obscuring NAT, as mentioned =
earlier.  This is helpful for HoneyPots where a single box/service is =
covering more than one IP/port.

For the interested, I can submit my own setup as an example.


Bob

