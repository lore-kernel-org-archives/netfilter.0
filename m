From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Virus Attack & String Matching
Date: Fri, 06 Aug 2004 16:21:56 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41132384.9000601@wildcash.com>
References: <54a712f004080523095fc37bee@mail.gmail.com>
Reply-To: tech@wildcash.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <54a712f004080523095fc37bee@mail.gmail.com>
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
To: ebaar@purdue.edu
Cc: netfilter@lists.netfilter.org

Hi Erik,

You can use mod_security, http://www.modsecurity.org/,
to match strings and drop packets for your Apache web server.

An option is to use Iptables for rate limiting and mod_security
for string matching and http deny.

This is my tatic, would be keen to hear of any better techniques.

HTH

Kind regards,
Rudi.

erikbaar@gmail.com wrote:

> Hello,
> 
> I've recently had to setup string matching to save a sever that was
> the subject of a virus DDOS attack, two of the domains on the server
> were recieving thousands of HTTP Get requests.  After setting up a
> limit rule to slow it down and patch the kernel, I setup a filter like
> this:
> 
> iptables -I INPUT -p tcp -d DEST_IP --dport -m string --string "GET
> /1.jpg" -j DROP
> iptables -I INPUT -p tcp -d DEST_IP --dport -m string --string "GET
> /get.php" -j DROP
> 
> Which dropped the traffic but caused Apache to generate 408 errors for
> every connection that was made.  First question, is there a better or
> alternate way to do this?  I've read people have recommended against
> string matching before but never found a good alternative.  Second, is
> there a way I can have IP tables on a match insert a DROP rule for the
> source IP address?  I wrote a script which did this based out of -j
> LOG output but would rather have it run everything automagically.
> 
> Regards,
> 
> Erik
> 
> 
> 


-- 

Regards,
Rudi.

Internet Media Productions

