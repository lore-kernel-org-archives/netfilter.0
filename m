From: "Brandon Broyles" <netfilter@drbroyles.com>
Subject: Re: what it is the better masquerade or SNAT
Date: Sat, 30 Nov 2002 00:14:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03a501c2982f$69ff9e80$4545450a@drbroyles.com>
References: <web-110040@gecyt.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Administrador de Red <admin@gecyt.cu>
Cc: netfilter@lists.netfilter.org


----- Original Message -----
From: "Administrador de Red" <admin@gecyt.cu>
To: <netfilter@lists.netfilter.org>
Sent: Friday, November 29, 2002 4:32 PM
Subject: what it is the better masquerade or SNAT


> I has a Ip public true, I want to do a firewall, but i don
> know wich I kind Should i use, masquerade or SNAT?,
> someone can i help?.
>

Using SNAT with a static IP is usually considered better.  Using masquerading
requires more overhead which isn't necessary if you already know what IP you are
going to use.

Brandon Broyles



