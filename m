From: sgmayo@mail.bloomfield.k12.mo.us
Subject: Iptables and URLs
Date: Tue, 27 Oct 2009 13:09:24 -0500 (CDT)
Message-ID: <2918.204.184.27.217.1256666964.squirrel@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have read that it is best not to use a string command and use URLs.  It
is better to use a proxy and I am doing that.  I am not sure what else to
do.  Here is my problem and maybe someone will have a suggestion.

I drop port 80 in my iptables.  This is because I don't want someone to
take out the proxy settings and be able to go around my filter
(Dansguardian/Squid).

I have a certain site that the teacher has to upload pictures to.  It will
always time out when it tries to upload.  I have put all the sites in the
white list in dansguardian so that it is not affecting them.  After a bit
of experimenting, I found out that if I remove the line where I drop port
80, the upload works fine.  Not really sure why this is happening since I
would think it would use my proxy port, but for some reason it is using
port 80 I guess.

I could go through and pass the ip addresses to the site in my iptables,
but the only problem is that they change frequently and that means that I
would have to edit my iptables every time an IP changes.  On the other
hand, the URLs stay the same, so I need to pass the URLs in my iptables.

I have a couple of questions about the script.  First of all, what is the
command that I use to pass a URL?  For example if I have an 'allowed'
chain and I have an ip of 222.222.222.222 which is the IP for
fake-url.com.  I could put:

$IPTABLES -A allowed -d 222.222.222.222 allowed

I was thinking that I had seen some 'string' command that would let me put
in a URL instead of the IP, but I don't see that in my tutorial manual,
unless I am over looking it.

Also, can I have an external file that lists URLs and have it included
into my script?

i.e.

If I have file /etc/rc.d/good_urls which contains

url1.com
url2.com
ulr3.com

Can I include that file in my script so that I can use an iptable rule to
let this list of files be passed through the iptables?

Thanks for any info.

-- 
Scott Mayo - System Administrator
Bloomfield Schools
PH: 573-568-5669  FA: 573-568-4565

Question: Because it reverses the logical flow of conversation.
Answer: Why is putting a reply at the top of the message frowned upon?

