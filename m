From: Remo Mattei <remo@remo.ws>
Subject: Re: hi guys passive firewall
Date: Sun, 07 Jul 2002 09:26:35 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D285DAB.9010908@remo.ws>
References: <3D27B365.2050705@remo.ws> <20020707080609.TFPL23840.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------050308070701020209090201"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter <netfilter@lists.samba.org>


--------------050308070701020209090201
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Antony Stone wrote:

>On Sunday 07 July 2002 4:20 am, Remo Mattei wrote:
>
>>I have an office with 64 ips which are all valid. I have some server
>>that do not need any security enable.
>>

>
>Oh yeah ?   What kind of servers are those, then ?   How come they're not 
>vulnerable to anything and therefore don't need any security :-) ?
>
I guess I should say that the server itself have a firewall not that do 
not need any security on them!!!

>
>>But I do have other that I will
>>have to firewall down any suggestions? Will all rules come in into the
>>input chains and then forward all other packages work.
>>
>
>Depends whether you're talking about putting netfilter onto the server itself 
>(in which case you filter the INPUT chain), or whether netfilter is on a 
>router between the servers and the Internet (in which case you filter the 
>FORWARD chain).
>
So I guess since the anwser is above I just will use the forward and let 
everything pass in the input.

Thanks anthony

> 
>
>Antony.
>


--------------050308070701020209090201
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<html>
<head>
</head>
<body>
<br>
<br>
Antony Stone wrote:<br>
<blockquote type="cite" cite="mid:20020707080609.TFPL23840.mta03-svc.ntlworld.com@there">
  <pre wrap="">On Sunday 07 July 2002 4:20 am, Remo Mattei wrote:<br><br></pre>
  <blockquote type="cite">
    <pre wrap="">I have an office with 64 ips which are all valid. I have some server<br>that do not need any security enable.<br></pre>
    </blockquote>
    </blockquote>
    <br>
    <blockquote type="cite" cite="mid:20020707080609.TFPL23840.mta03-svc.ntlworld.com@there">
      <pre wrap=""><br>Oh yeah ?   What kind of servers are those, then ?   How come they're not <br>vulnerable to anything and therefore don't need any security :-) ?<br></pre>
      </blockquote>
I guess I should say that the server itself have a firewall not that do not
need any security on them!!!<br>
      <blockquote type="cite" cite="mid:20020707080609.TFPL23840.mta03-svc.ntlworld.com@there">
        <pre wrap=""><br></pre>
        <blockquote type="cite">
          <pre wrap="">But I do have other that I will<br>have to firewall down any suggestions? Will all rules come in into the<br>input chains and then forward all other packages work.<br></pre>
          </blockquote>
          <pre wrap=""><!----><br>Depends whether you're talking about putting netfilter onto the server itself <br>(in which case you filter the INPUT chain), or whether netfilter is on a <br>router between the servers and the Internet (in which case you filter the <br>FORWARD chain).<br><br></pre>
          </blockquote>
So I guess since the anwser is above I just will use the forward and let
everything pass in the input.<br>
          <br>
Thanks anthony<br>
          <br>
          <blockquote type="cite" cite="mid:20020707080609.TFPL23840.mta03-svc.ntlworld.com@there">
            <pre wrap=""> <br><br>Antony.<br><br></pre>
            </blockquote>
            <br>
            </body>
            </html>

--------------050308070701020209090201--


