From: "Andrew Greenburg (Intelenet)" <agreenbu@in-span.net>
Subject: Re: Too long delay
Date: Tue, 22 Jul 2003 11:42:21 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.20.0307221141030.20422-100000@jefferson.indtn.net>
References: <200307221233.06581.vlady@cyber2000.qc.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307221233.06581.vlady@cyber2000.qc.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, 22 Jul 2003, root wrote:

> I have seted up rules for SMTP and FTP server on a firewall and they work 
> exept that I should whait 10 and more seconds before to get a responce from 
> the server.
> I tryed to log all droped packates to see if there are some packtes which are  
> related to smtp (or ftp) connection but there any.

This is probably an identd issue. If you create a rule to REJECT identd
packets instead of dropping them, this should help.

-- 
 Andrew M. Greenburg                   |   agreenbu   @  in-span   .   net
 Systems Engineer                      |   (317)234-1001     (317)234-1328
 Indiana Web Academy                   |   Phone             Fax


