From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SMTP filter
Date: Fri, 5 Mar 2004 12:50:13 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403051250.13257.Antony@Soft-Solutions.co.uk>
References: <OFB3C042D3.9AD4475C-ONC1256E4E.00442B5D@atd.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFB3C042D3.9AD4475C-ONC1256E4E.00442B5D@atd.es>
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

On Friday 05 March 2004 12:27 pm, david@atd.es wrote:

> Hello World

Hello David

> I want to accept only all the SMTP trafic, port 25, from the source ip my
> ISP ?

Assuming default DROP policy (of course):

iptables -A INPUT -p tcp --dport 25 -s isp.smtp.ser.ver -j ACCEPT

(change INPUT to FORWARD if this is a routing firewall - the above rule would 
work on the mail server itself).

> Is that correct to block the SPAM ?

No - unless your ISP provides good spam-filtering for you.

Spam is an OSI layer 7 problem; netfilter operates at layers 3/4.   
Investigate SpamAssassin, MailScanner, etc.

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


