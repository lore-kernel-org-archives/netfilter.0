From: guillaume <guillaume.riviere@hcm.vsl-vn.com>
Subject: Re: 2 ISP NAT configuration
Date: Fri, 30 Jul 2004 10:38:36 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4109C2BC.7050208@hcm.vsl-vn.com>
References: <20040729134927.41DACAD56@sitemail.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040729134927.41DACAD56@sitemail.everyone.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dear Alok (is it your first name ?),

Thank you so much for this link, It will be very useful for me.
I'am going to test it ASAP.  I currently download the pach.

Do you know if there is a way to detect a down connection ?
I am currently using icpld, do I have to build a script to
redirect all on the other connection when the first is down ?

Thank you so much,
Guillaume

Alok Nath Upadhyay wrote:

>dear guillaume,
>hi.
>i am currently working on the same kind of problem. i have three ISP links for connecting to the internet. 2 of these links have dynamic address and remaining one has static address. Now i wanted all of my LAN traffic to these 3 links simultaneously. i.e. in load balancing mode while keeping all links buzzing with traffic. i found a site whih was very useful for me. this is www.linux.com.lb. in the howto section there is a load balancing howto. moreover there is a patch available with netfilter at official site www.netfilter.org. this patch is named as random patch and i am using it to distribute the traffic as 33/33/33 percentagle of the total traffic on various ISP links. try it and i hope your problem will be resolved.
>
>
>Alok Nath Upadhyay
>Suntech (OSM) Team
>PC Solutions (P) Limited
>12, Sant Nagar, East of Kailash
>New Delhi - 110 065.
>Tel.: +91-11-2621 3355 / 2621 7766 / 2688 4433 (Ext.: 51)
>Fax : +91-11-647 6822
>
>
>
>--- guillaume <guillaume.riviere@hcm.vsl-vn.com> wrote:
>Dear All netfilter users and developpers,
>
>This software is an amazing software,
>We are are very happy of this solution
>for our office.
>
>Now, I need some help to improve our network:
>
>Our office is based in Vietnam, and in this country
>(for the moment) all internet connections are unstable.
>
>We currently use an ISP with a (slow) connection, but
>providing real static IP address (6). We want to add a second ISP
>to our office with non static IP Address. They provide us also a
>modem/router for NAT.
>
>We already install a GNU/Debian Router with netfiler support (2.6 kernel)
>in order to manage our first ISP link.
>
>We would like to add a network card in this router and "loadbalance"
>our internet connection between those two ISPs.
>
>The problem is that some of our internal IP need to be link to
>a real external IP on the first provider only (For VPN connections).
>
>Is it possible with netfilter to link some internal IP to a "load 
>balancing" between 2 ISPs and some other on just one of those ISP ?
>
>Is there a possibility to detect a "down" line and to use automatically 
>the second line for all our internals IP ?
>
>How can I manage the differents bandwith with "load balancing" ( I mean, 
>my first ISP average is something around 64 kbps and my second is 512 
>kpbs: How can I said to net filter 20% on this line and 80% on this line)
>
>Is there How to or Dosumentation for this on 2.6 kernel ?
>
>Thank you in advance for your help,
>
>Guillaume
>
> 
>
>
>
>  
>


