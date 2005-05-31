From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: POP3 (Port No. 110)
Date: Tue, 31 May 2005 02:07:38 -0500
Message-ID: <429C0D3A.9060703@riverviewtech.net>
References: <9bc7d29205053023395fb1fc5a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9bc7d29205053023395fb1fc5a@mail.gmail.com>
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

> I have Sendmail configured on my server and I am able to send and
> receive mails in the intranet. Now I want to be able to access the
> mails from outside world also but i dont want to open the port for
> every one. I want to open the pop3 port for the perticular IP (it may
> be static or dynamic IP) in the IPTABLES and close the port when not
> needed to access from outside.
> 
> Please some one tell me how to do this and can I have some script
> which will open the port when i need and close when not needed so that
> I don't have to enter into the iptables every time.
> 
> How to open the pop3 port for a perticular external ipaddress

Presuming that you are not filtering on output it is easy to allow a specific IP access to your POP3 server.

iptables -t filter -A INPUT -s ! ${known_external_ip_address} -p tcp --dport 110 -j DROP

This will drop any traffic that comes to port 110 that is not from the known external ip address.

If you are wanting more help setting up a script to manage this for you such that you can say pop_open and / or pop_close let me know and I'll see what I can whip up.



Grant. . . .

