From: Oumer Teyeb <oumer@kom.auc.dk>
Subject: Re: about ipq_set_verdict()
Date: Wed, 21 Apr 2004 08:56:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40861B02.3080601@kom.auc.dk>
References: <036e01c4227f$1611e900$68892090@grouse> <40853764.2090504@kom.auc.dk> <015d01c426ed$b9047c00$68892090@grouse>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010801090701020905060202"
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
To: netfilter@lists.netfilter.org


--------------010801090701020905060202
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit

Hi Jee,

I think you have mistaken packet +1 to be the next data byte. Since
packet is a pointer to the struct ipq_packet_msg by pointer arthimetic
packet +1 will give you the pointer to the data byte after n bytes,
where n is the amount of bytes in a ipq_packet_msg struct.


so what we have is something like

packet -------points to---------> start of ipq_packet_msg

packet +1---------points to --------> data byte just after the
ipq_packet_msg struct

so if I set unsigned char * packet_all =(unsigned char*)(packet +1);
this gives me the pointer to the packet data (header + payload)

but if I say

unsigned char * packet_all =((unsigned char * )(packet)) + 1, then sure
this points to the packet id

hope this makes it clear

As to become sure, the code snippets I gave you are from actual working
code, and you can try it out.

Regards,
Oumer

Jee J.Z. wrote:

>Hi Oumer,
>
>Thank you for your explanations. They are quite helpful. Please see inline:
>
>
>>In the man pages it says that if you get a negative value then it is a
>>failure , otherwise it is a sucess.
>>
>
>Right. I've figured out the return value of ipq_set_verdict(), which is 28 +
>data_len (one of the input parameters of ipq_st_verdict specified by users).
>
>>The reason that you may get the packets dropped may be because you
>>modified them in such a way that they are not valid anymore (you change
>>thing to an invalid ip address or something like that)
>>
>
>Right. But I think I made some changes on the overhead of libipq itself
>rather than on packets, which caused the kernel confused and couldn't figure
>out what the infomation means returned by ipq_set_verdict.
>
>>On how to get the packet info
>>
>>Once you get the packet = ipq_get_packet(buffer)
>>
>>you can access the packet data (including header and payload) from
>>memory location packet +1,
>>
>
>As far as I can see, there are some overheads (info) used by
>ip_queue/netfilter to identify the packet (such as packet_id) and to provide
>some useful info (such as timestamp) to userspace. Therefore, 'packet+1'
>seems not the location of putting the pure packet data (header and payload).
>Instead, from the man page of ipq_get_packet (see the structure of
>ipq_packet_msg), packet+1 should be packet_id. no?
>
>>for example
>>
>>you can use something like
>>
>>usigned char *packet_all = (unsigned char *) (packet+1);
>>
>>then for example to access the ip_header length, which is located from
>>bits 4-7 in the ip header you can use something like
>>
>>ip_header_len = (*packet_all & 0xF) * 4; // the 4 is since the header
>>length is specified as a multiple of 32bits,ie 4 bytes
>>
>>or you can get the total length, which is the third and fourth bytes of
>>the header as
>>
>>total_len = htons(*(unsigned short *) (packet_all + 2)))
>>
>>and so on,
>>
>>and based on the value of this ip header length and the data offset in
>>the tcp header,
>>
>>
>>(to find the data offset in the tcp header you can use something like
>>
>>tcp_header_len = ((*(packet_all + ip_header_len + 12 ) & 0xF0) >> 4 )*
>>4; // the 12 is because we have 2 bytes for source port + 2 bytes for
>>destination port, 4 bytes for sequence number and 4 bytes for ack number
>>in the tcp header before we reach the data offset
>>
>>
>>so the data payload is from unsinged char *start = (packet_all +
>>ip_header_len+ tcp_header_len) till unsinged char *end = start + total_len
>>
>>
>>and I think you can just set the values of the packet, whether header or
>>payload, once you got a pointer to it
>>
>
>Thank you very much for these excellent examples. They make sense. I am just
>a bit confused whether packet+1 is the start point of a packet including its
>header.
>
>Cheers,
>Jee
>
>>
>>
>>Jee J.Z. wrote:
>>
>>>Hi all,
>>>
>>>I am using the libipq library to do userspace programming on netfilter. I
>>>
>am
>
>>>having some problems understanding the return values of the function
>>>ipq_set_verdict():
>>>
>>>When I set verdict (either NF_ACCEPT or NF_DROP) without modifying the
>>>packet, the return value of ipq_set_verdict is 28 and everything works
>>>
>well;
>
>>>however, when I set verdict trying to modify the packet, ipq_set_verdict
>>>returns 88, and the packet seems always to be dropped even when I set
>>>NF_ACCEPT.
>>>
>>>Does anybody know what these return values mean? Moreover, could anybody
>>>tell me how I can successfully modify a packet using libipq? Thank you
>>>
>very
>
>>>much in advance!!
>>>
>>>Regards,
>>>Jee
>>>
>>>
>>>
>>
>>
>>
>
>


--------------010801090701020905060202
Content-Type: text/html; charset=GB2312
Content-Transfer-Encoding: 7bit

<html>
<head>
</head>
<body>
Hi Jee,<br>
<br>
I think you have mistaken packet +1 to be the next data byte. Since packet
is a pointer to the struct ipq_packet_msg by pointer arthimetic packet +1
will give you the pointer to the data byte after n bytes, where n is the
amount of bytes in a ipq_packet_msg struct.<br>
<br>
<br>
so what we have is something like <br>
<br>
packet -------points to---------&gt; start of ipq_packet_msg<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br>
packet +1---------points to --------&gt; data byte just after the ipq_packet_msg
struct<br>
<br>
so &nbsp;if I set unsigned char * packet_all =(unsigned char*)(packet +1);<br>
this gives me the pointer to the packet data (header + payload)<br>
<br>
but if I say<br>
<br>
unsigned char * packet_all =((unsigned char * )(packet)) + 1, then sure this
points to the packet id<br>
<br>
hope this makes it clear<br>
<br>
As to become sure, the code snippets I gave you are from actual working code,
and you can try it out.<br>
<br>
Regards,<br>
Oumer<br>
<br>
Jee J.Z. wrote:<br>
<blockquote type="cite" cite="mid:015d01c426ed$b9047c00$68892090@grouse">
  <pre wrap="">Hi Oumer,<br><br>Thank you for your explanations. They are quite helpful. Please see inline:<br><br><br></pre>
  <blockquote type="cite">
    <pre wrap="">In the man pages it says that if you get a negative value then it is a<br>failure , otherwise it is a sucess.<br></pre>
    </blockquote>
    <pre wrap=""><!----><br>Right. I've figured out the return value of ipq_set_verdict(), which is 28 +<br>data_len (one of the input parameters of ipq_st_verdict specified by users).<br><br></pre>
    <blockquote type="cite">
      <pre wrap="">The reason that you may get the packets dropped may be because you<br>modified them in such a way that they are not valid anymore (you change<br>thing to an invalid ip address or something like that)<br></pre>
      </blockquote>
      <pre wrap=""><!----><br>Right. But I think I made some changes on the overhead of libipq itself<br>rather than on packets, which caused the kernel confused and couldn't figure<br>out what the infomation means returned by ipq_set_verdict.<br><br></pre>
      <blockquote type="cite">
        <pre wrap="">On how to get the packet info<br><br>Once you get the packet = ipq_get_packet(buffer)<br><br>you can access the packet data (including header and payload) from<br>memory location packet +1,<br></pre>
        </blockquote>
        <pre wrap=""><!----><br>As far as I can see, there are some overheads (info) used by<br>ip_queue/netfilter to identify the packet (such as packet_id) and to provide<br>some useful info (such as timestamp) to userspace. Therefore, 'packet+1'<br>seems not the location of putting the pure packet data (header and payload).<br>Instead, from the man page of ipq_get_packet (see the structure of<br>ipq_packet_msg), packet+1 should be packet_id. no?<br><br></pre>
        <blockquote type="cite">
          <pre wrap="">for example<br><br>you can use something like<br><br>usigned char *packet_all = (unsigned char *) (packet+1);<br><br>then for example to access the ip_header length, which is located from<br>bits 4-7 in the ip header you can use something like<br><br>ip_header_len = (*packet_all &amp; 0xF) * 4; // the 4 is since the header<br>length is specified as a multiple of 32bits,ie 4 bytes<br><br>or you can get the total length, which is the third and fourth bytes of<br>the header as<br><br>total_len = htons(*(unsigned short *) (packet_all + 2)))<br><br>and so on,<br><br>and based on the value of this ip header length and the data offset in<br>the tcp header,<br><br><br>(to find the data offset in the tcp header you can use something like<br><br>tcp_header_len = ((*(packet_all + ip_header_len + 12 ) &amp; 0xF0) &gt;&gt; 4 )*<br>4; // the 12 is because we have 2 bytes for sou
 rce port + 2 bytes for<br>destination port, 4 bytes for sequence number and 4 bytes for a
ck number<br>in the tcp header before we reach the data offset<br><br><br>so the data payload is from unsinged char *start = (packet_all +<br>ip_header_len+ tcp_header_len) till unsinged char *end = start + total_len<br><br><br>and I think you can just set the values of the packet, whether header or<br>payload, once you got a pointer to it<br></pre>
          </blockquote>
          <pre wrap=""><!----><br>Thank you very much for these excellent examples. They make sense. I am just<br>a bit confused whether packet+1 is the start point of a packet including its<br>header.<br><br>Cheers,<br>Jee<br><br></pre>
          <blockquote type="cite">
            <pre wrap=""><br><br>Jee J.Z. wrote:<br><br></pre>
            <blockquote type="cite">
              <pre wrap="">Hi all,<br><br>I am using the libipq library to do userspace programming on netfilter. I<br></pre>
              </blockquote>
              </blockquote>
              <pre wrap=""><!---->am<br></pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="">having some problems understanding the return values of the function<br>ipq_set_verdict():<br><br>When I set verdict (either NF_ACCEPT or NF_DROP) without modifying the<br>packet, the return value of ipq_set_verdict is 28 and everything works<br></pre>
                  </blockquote>
                  </blockquote>
                  <pre wrap=""><!---->well;<br></pre>
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre wrap="">however, when I set verdict trying to modify the packet, ipq_set_verdict<br>returns 88, and the packet seems always to be dropped even when I set<br>NF_ACCEPT.<br><br>Does anybody know what these return values mean? Moreover, could anybody<br>tell me how I can successfully modify a packet using libipq? Thank you<br></pre>
                      </blockquote>
                      </blockquote>
                      <pre wrap=""><!---->very<br></pre>
                      <blockquote type="cite">
                        <blockquote type="cite">
                          <pre wrap="">much in advance!!<br><br>Regards,<br>Jee<br><br><br><br></pre>
                          </blockquote>
                          <pre wrap=""><br><br><br></pre>
                          </blockquote>
                          <pre wrap=""><!----><br><br></pre>
                          </blockquote>
                          <br>
                          </body>
                          </html>

--------------010801090701020905060202--


