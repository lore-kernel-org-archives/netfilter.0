From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rules for Blocking Proxies...
Date: Tue, 20 Apr 2004 08:35:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404200835.59747.Antony@Soft-Solutions.co.uk>
References: <000b01c426f6$cc216f10$36b4fea9@SABNANIS>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c426f6$cc216f10$36b4fea9@SABNANIS>
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

On Tuesday 20 April 2004 5:44 pm, Harry wrote:

> Hi All,
> I am running Fedora and Redhat 9 on two servers at my Cybercafe, connected
> on two Hi speed Lines, I have a decent firewall script, but these days I am
> facing issues about people changing the Proxy settings in order to get thru
> porn sites, can anybody suggest some rules which I can implement in the
> script that avoids connection to these servers? Suggestions are welcome.

The firewall should allow connections to remote web servers (ie TCP --dport 
80, 8080 etc) from the proxy server's IP only.

Don't allow any other IP address in your network to connect to an external 
address on dport 80.

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - Report in the New York Times, following a demonstration at the 1939 World's 
Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


