From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FTP passive not working
Date: Tue, 13 Apr 2004 20:37:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404132037.35477.Antony@Soft-Solutions.co.uk>
References: <20040413114125.6d159e42@mgalepc.utilitran.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040413114125.6d159e42@mgalepc.utilitran.com>
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

On Tuesday 13 April 2004 6:41 pm, Michael Gale wrote:

> Hello,
>
> I am having trouble getting a FTP connection to work in passive mode from
> behind a firewall.
>
> On the FTP server I have two IP's one used for internal connections and one
> used for external connections. The external one is .36 .. so in the
> proftpd.conf file I used the following:

<snip...>

> So when I try passive my client tried to connect to the external IP of the
> firewall on a port > 1024.

1. Where is the client, which is connecting to the external address?

2. Do passive connections to this server work from your LAN, not going through 
the firewall?

3. Do passive connections to external servers, from clients on your LAN, work 
through the firewall?

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


