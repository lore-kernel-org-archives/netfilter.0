From: "J and T" <j_and_t@hotmail.com>
Subject: Re: Stopping greedy http clients!
Date: Sat, 28 Sep 2002 07:58:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F11wTYX8FBdxrA8SWL10000b57c@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david@dark.x.dtu.dk
Cc: netfilter@lists.netfilter.org

<html><div style='background-color:'><DIV><mailto:netfilter-request@lists.netfilter.org?subject=help><mailto:netfilter@lists.netfilter.org><mailto:netfilter-request@lists.netfilter.org?subject=subscribe><mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
<P>Hi David,</P>
<P>Yes I did already look at this program, but it fell short for my needs. What I did instead was write a mod_perl module for logging the IP and time&nbsp;of request for certain files and/or directories. This allows me to log only those areas that I want to put a speed limit on. It's pretty simple really and it has been working wonderfully. A human can only click so fast regardless of how fast their computer or net connection is. Plus a human is there to view/read your content which means the client will at least spend a couple of seconds before clicking.</P>
<P>So what I did was log all requests to certain directories and/or files. I log the IP and time the client accessed this area. Then a root cron job runs every minute to digest this information. If 5 consecutive requests were made that broke the speed limit I simply enter&nbsp;the IP in the iptable with rule of greedy and deny them access for 5 minutes. Those that were previously breaking the speed limit and have been blocked for 5 minutes is then given access again. </P>
<P>Anyone breaking the speed limit is also recorded in&nbsp;a MySQL&nbsp;table. Then in this table if the same IP was blocked more than X number of times in the last&nbsp;X number of&nbsp;hours, I can block them&nbsp;for longer periods of time. This time period increases as the number of tickets he/she receives over time.</P>
<P>So far this has worked out wonderfully and I have total control. With iplimit it handles all requests like CSS, server side JS, images, html etc. without anyway to control what it logs.&nbsp;It was virtually impossible to control because many browsers download all this information at once. So a client could break the speed limit where a robot won't because they don't download all the server side stuff or images. With a client visiting a page and you have 30 images on that page, the browser will download all 30 images concurrenly (like Opera for example and I believe IE does too). So that's 30 images and the HTML file plus the server side stylesheet for&nbsp;a total of 32 concurrent requests. A robot could easily&nbsp;download 20 pages simultaneously without breaking this&nbsp;speed limit, but still be robbing you blind.</P>
<P>In addition to all this we also want to make sure we don't block out robots like Google so you have to limit who you place a restriction on (not to mention yourself). iplimit or tcplimit&nbsp;does not allow this kind of control. In fact you could actually block yourself out of your own system.</P>
<P>There are still possible problems with both my mod_perl and iplimit. What about proxy servers, caching servers or ip masqurading? AOL often shares the same IP for hundreds if not thousands of visitors. One way to combat this is to set a client cookie which these proxy's won't of course have which means each client accessing the site would have a unique ID that you can now use with your IP (ie, key_ip combination). Those that don't allow cookies you can deal with in anyway you wish (probably the standard way).</P>
<P>Just thought I would share how I am dealing with this problem currently. I know a lot of people who have popular sites with ever changing content have this same problem. Search engines like Google for example are having their content robbed from them by all these so called "META Search Engines!". They consume Google's resources by running a robot on their site to fetch search results and present them on their own site often even claiming that the results are their own. Google doesn't get paid for this, but their bandwidth is robbed from them. I have to pay for my bandwidth so I'm certainly not going to allow it to be stolen from me.</P>
<P>Have a good one and thanks for replying,</P>
<P>John</P>
<P>&nbsp;</P>
<P>&gt;&nbsp;&gt; Is there a way to set a "speed limit" on tcp port 80 requests? Here's my </P></DIV>
<DIV></DIV>&gt; &gt; problem: 
<DIV></DIV>&gt; &gt; 
<DIV></DIV>&gt; &gt; I have a very popular site with hundreds of pages updated dynamically every 
<DIV></DIV>&gt; &gt; 4 hours. Since high-speed internet access has become more popular, I have 
<DIV></DIV>&gt; &gt; found more and more visitors using robots to download all pages in one 
<DIV></DIV>&gt; &gt; quick multi-threaded connection. When you have a 1,000 people downloading 
<DIV></DIV>&gt; &gt; 100 pages all at once you end up with a problem. I can't just block them by 
<DIV></DIV>&gt; &gt; their IP because their IPs are dynamic. 
<DIV></DIV>&gt; 
<DIV></DIV>&gt;I would take a look at iplimit from patch-o-matic, which "allows you to 
<DIV></DIV>&gt;restrict the number of parallel TCP connections to a server per client IP 
<DIV></DIV>&gt;address (or address block)". It will not block the access to your site, but 
<DIV></DIV>&gt;you can use it to limit the number of parallel downloads the clients can 
<DIV></DIV>&gt;use. 
<DIV></DIV>&gt; 
<DIV></DIV>&gt;- David 
<DIV></DIV></mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe></mailto:netfilter-request@lists.netfilter.org?subject=subscribe></mailto:netfilter@lists.netfilter.org></mailto:netfilter-request@lists.netfilter.org?subject=help></div><br clear=all><hr>Send and receive Hotmail on your mobile device: <a href='http://g.msn.com/1HM1ENUS/c152??PI=44364'>Click Here</a><br></html>

