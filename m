From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Web Browser Information Leakage through NetFilter:
Date: Fri, 27 Sep 2002 01:08:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020927000832.XTYP28842.mta06-svc.ntlworld.com@there>
References: <FLEKIPPLAEDMJMOOBBDPGEBBDAAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPGEBBDAAA.stewart.thompson@shaw.ca>
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

On Friday 27 September 2002 12:49 am, Stewart Thompson wrote:

> Hi All:
>
> 	I was redirected to some German web site.

Please could you post the URL - either to the list, or to me privately - I 
would like to investigate what you have seen.

> I couldn't read the text obviously, but the gist was I
> was insecure, it showed a completely accurate listing
> of all the folders on my Windows machine I was using
> the browser on at the time.

That indicates either:

a) that your firewall was allowing some subset (I can't remember the precise 
details offhand) of TCP/UDP ports 137,138,139 *IN* from the remote server to 
your browsing machine, and the remote server could therefore peruse your 
Windows shares, or

b) that your browser downloaded some active content from the web server, 
executed that active content (which scanned local directories), and then 
either displayed it in the window of your browser (you hope), or sent it back 
to the server for it to return as an html view in the window of your browser

> Obviously I wasn't to please
> about this. I am assuming it is a function of the Browser
> and Server, and not a direct problem with my firewall.
> I am running IE V6 on that machine.

I would not be at all surprised if this simply ran some active content (Java, 
VBScript, ActiveX, that sort of thing) without telling you, and may or may 
not have returned something just as interesting to the remote server.

> 	So the question is, can a malicious website access
> Sensitive data with this method?

Yes - definitely.

> Is there some way to block this with Netfilter and/or Browser settings?

Netfilter ?   No.   Browser ?   Yes.   I would suggest upgrading to Netscape, 
Konqueror, Mozilla, Opera.......

To quote from the KDE website:
"KDE 3.0.3 contains an important fix for handling SSL certificates," 
explained Waldo Bastian, the KDE developer responsible for implementing a fix 
shortly after the KDE Project became aware of the issue. "Anyone who uses 
Konqueror for secure transactions on the Internet is strongly urged to 
upgrade. Users of Internet Explorer, which suffers from the same problem but 
which does not yet have a fix available, are also encouraged to switch to KDE 
3.0.3." 

Seriously though, there is going to be something in the Options available in 
either IE6 or possibly on Control Panel - Internet Connection to say what 
active content you are prepared to accept.   I can't point you straight at 
the bit you need to change, because I've never used IE on a machine, however 
there must be something there somewhere.   A search on Google for Internet 
Explorer Security Settings might be a good place to start.

I'd still be interested to see the URL.

Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

