From: Chris Poupart <cpoupart@canada.com>
Subject: Re: Web Browser Information Leakage through NetFilter:
Date: Thu, 26 Sep 2002 21:51:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D93B9A0.8060901@canada.com>
References: <FLEKIPPLAEDMJMOOBBDPEEBEDAAA.stewart.thompson@shaw.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: stewart.thompson@shaw.ca, netfilter@lists.netfilter.org

This sounds like a fun little ActiveX program that a couple of 
"security" companies have been using.  I know that 
Evidence-eliminator.com does this.  Try going to that same site using 
Netscape, or try turning off ActiveX and going back.  My guess is that 
it will not show up.

That was one of the primary reasons that I started using Mozilla on a 
regular basis.

-- Chris

Stewart Thompson wrote:

>Hi Rowan:
>
>	Thanks for the reply. IT may be the second option where it
>shows you it locally. It is an accurate display of my C drive. Not a
>generic one. I run Norton every day. First it does a live update, then
>a full system scan. So, I am pretty sure I don't have any viruses.
>I have security on IE6 set to high, likewise for cookies, but it still
>seems to act the same.
>
>Stu........
>
>
>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org
>[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Rowan Reid
>Sent: September 26, 2002 5:25 PM
>To: stewart.thompson@shaw.ca; netfilter@lists.netfilter.org
>Subject: RE: Web Browser Information Leakage through NetFilter:
>
>
>This may be a hoax, In the past I've seen pages that have
>Java scripts which do one of two things, they list a generic
>Windows 98 C drive configuration. The page scrolls by so fast is seems
>it has you exact drive contents. The next one I've seen is an actual
>java script that reads your drive locally and makes it look like it's on
>the page but I don't think IE allows this anymore. The third and most
>likely possibility is you have been nimda and it's left your shares
>open. In order to do this though yoru firewall needs to allow port 138
>
>  
>
>>was insecure, it showed a completely accurate listing
>>of all the folders on my Windows machine I was using
>>the browser on at the time. Obviously I wasn't to please
>>about this. I am assuming it is a function of the Browser
>>and Server, and not a direct problem with my firewall.
>>I am running IE V6 on that machine.
>>      So the question is, can a malicious website access
>>Sensitive data with this method? Is there some way to block
>>this with Netfilter and/or Browser settings?
>>
>>    
>>
>
>
>
>  
>




